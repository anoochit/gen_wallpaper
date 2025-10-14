import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/wallpaper.dart';

late Isar db;

Future<void> initDatabase() async {
  log('init database');
  // find database dir
  final dir = await getApplicationDocumentsDirectory();

  // init database
  db = await Isar.open(
    [WallpaperSchema],
    name: 'default',
    directory: dir.path,
  );
}
