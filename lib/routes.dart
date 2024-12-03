import 'package:dock_app/pages/dock_controller.dart';
import 'package:dock_app/pages/dock_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/home';
  static final routes = [
    GetPage(
        name: home,
        page: () => DockPage(),
        binding: BindingsBuilder(
          () => Get.lazyPut(
            () => DockController(),
          ),
        ))
  ];
}
