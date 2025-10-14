import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/app_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/services/isar.dart';

Future<void> main() async {
  // init widget binding
  WidgetsFlutterBinding.ensureInitialized();
  // init app controller
  final controller = Get.put(AppController(), permanent: true);
  // init database
  await initDatabase();
  // load data
  await controller.loadWallpaperAssets();
  // run app
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    ),
  );
}
