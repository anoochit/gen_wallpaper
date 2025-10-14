import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'generated_wallpaper_view.dart';
import 'local_wallpaper_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Wallpaper'),
        centerTitle: true,
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.navIndex.value,
          children: const [
            // wallpaper
            LocalWallpaperView(),
            // user generated wallpaper
            GeneratedWallpaperView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.navIndex.value,
          onDestinationSelected: (value) => controller.navIndex.value = value,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.image_outlined),
              icon: Icon(Icons.image),
              label: 'Explore Ideas',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.folder_outlined),
              icon: Icon(Icons.folder),
              label: 'My Creations',
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.GENERATE);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
