import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/controllers/login_controller.dart';
import 'package:pas1_mobile_11pplg2_32/controllers/register_controller.dart';

import '../controllers/dashboard_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
