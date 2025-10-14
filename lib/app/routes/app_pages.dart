import 'package:get/get.dart';

import '../modules/generate/bindings/generate_binding.dart';
import '../modules/generate/views/generate_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/view_image/bindings/view_image_binding.dart';
import '../modules/view_image/views/view_image_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GENERATE,
      page: () => const GenerateView(),
      binding: GenerateBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_IMAGE,
      page: () => const ViewImageView(),
      binding: ViewImageBinding(),
    ),
  ];
}
