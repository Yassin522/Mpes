import 'package:get/get.dart';
import 'package:mpes/view/modules/signup/signup_controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
  }
}
