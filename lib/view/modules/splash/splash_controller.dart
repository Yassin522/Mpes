import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mpes/config/user_information.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late GetStorage _storage;
  @override
  void onInit() async {
    _storage = GetStorage();
    await CheckID();
    super.onInit();
  }

  Future<void> CheckID() async {
    String? ID = await _storage.read('id');
    if (ID != null) {
      UserInformation.User_Id = ID;
      Get.offAllNamed('/Home');
    } else {
      Get.offNamed('/Login');
    }
  }
}
