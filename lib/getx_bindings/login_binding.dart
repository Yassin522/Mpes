import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    // TODO: implement dependencies
  }
}
