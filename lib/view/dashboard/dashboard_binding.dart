import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../controller/category_controller.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(AuthController());
  }
}
