import 'dart:typed_data';
import 'package:ai_wallpaper/app/models/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class WallpaperItem extends StatelessWidget {
  const WallpaperItem({
    super.key,
    required this.item,
  });

  final Wallpaper item;

  @override
  Widget build(BuildContext context) {
    final data = item.imageData;
    final image = Uint8List.fromList(data!);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          //
          Get.toNamed(Routes.VIEW_IMAGE, arguments: item);
        },
        child: Image.memory(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
