import 'dart:developer';
import 'dart:io';

import 'package:ai_wallpaper/app/services/stability.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../data/local_wallpaper.dart';
import '../models/wallpaper.dart';
import '../services/isar.dart';

class AppController extends GetxService {
  RxList<Wallpaper> listWallpaper = <Wallpaper>[].obs;
  RxList<Wallpaper> listGeneratedWallpaper = <Wallpaper>[].obs;

  // load wallpaper asset to database
  loadWallpaperAssets() async {
    log('load wallpaper assets');
    // await db.writeTxn(() async {
    //   await db.wallpapers.clear();
    // });
    final total = await db.wallpapers.count();
    log('found $total items in collection');
    if (total == 0) {
      // load local wallpaper to database
      for (var item in localWallpapers) {
        log('save wallpaper = ${item.assets}');
        ByteData byteData = await rootBundle.load(item.assets);

        final wallpaper = Wallpaper()
          ..prompt = item.prompt
          ..template = item.template
          ..type = WallpaperType.local
          ..imageData = byteData.buffer
              .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)
              .toList();

        await db.writeTxn(() async {
          await db.wallpapers.put(wallpaper);
        });
      }
    }

    // load wallpaper
    loadWallpaper();
    // load generated
    loadGeneratedWallpaper();
  }

  // load wallpaper from database
  loadWallpaper() {
    log('load assets to app controller');
    db.wallpapers
        .filter()
        .typeEqualTo(WallpaperType.local)
        .findAll()
        .then((value) {
      listWallpaper.value = value;
      log('found assets ${value.length} items in collection');
    });
  }

  // load generated wallpaper from database
  loadGeneratedWallpaper() {
    log('load generated to app controller');
    db.wallpapers
        .filter()
        .typeEqualTo(WallpaperType.generated)
        .findAll()
        .then((value) {
      listGeneratedWallpaper.value = value;
      log('found generated ${value.length} items in collection');
    });
  }

  // save wallpaper to database
  Future<void> saveWallpaper(
      {required Uint8List image,
      required String prompt,
      required String template,
      required WallpaperType type}) async {
    final wallpaper = Wallpaper()
      ..prompt = prompt
      ..template = template
      ..type = type
      ..imageData = image.toList();
    await db.writeTxn(() async {
      await db.wallpapers.put(wallpaper);
    });
  }

  // save to image gallery
  Future<void> saveToImageGallery(
      {required Uint8List imageBytes, String format = "png"}) async {
    // save to image gallery
    try {
      await ImageGallerySaver.saveImage(
        imageBytes,
        name: '${DateTime.now().microsecondsSinceEpoch}.$format',
      );
    } catch (e) {
      throw ('Cannot save to image gallery');
    }
  }

  // gen image
  Future<Uint8List> generateTextToImage(
      {required String prompt,
      String format = 'png',
      String ratio = '9:16'}) async {
    return await Stability().textToImage(
      prompt: prompt,
      format: format,
      ratio: ratio,
    );
  }

  // share
  Future<ShareResult> share({required Uint8List imageBytes}) async {
    final path = await getApplicationDocumentsDirectory();

    final filename = '${path.path}${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File(filename);
    await file.writeAsBytes(imageBytes);

    return await Share.shareXFiles([XFile(filename)]);
  }
}
