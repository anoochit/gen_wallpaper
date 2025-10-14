import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/app_controller.dart';
import 'wallpaper_item.dart';

class LocalWallpaperView extends GetView<AppController> {
  const LocalWallpaperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 16,
        ),
        itemCount: controller.listWallpaper.length,
        itemBuilder: (BuildContext context, int index) {
          final item = controller.listWallpaper[index];
          return WallpaperItem(item: item);
        },
      ),
    );
  }
}
