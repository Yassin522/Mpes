import 'package:get/get.dart';
import 'package:mpes/view/modules/welcome/welcome_controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
    // TODO: implement dependencies
  }
}
