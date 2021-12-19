import 'package:get/get.dart';
import 'package:mpes/view/modules/profile/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
    // TODO: implement dependencies
  }
}
