import 'package:get/get.dart';
import 'package:mpes/view/modules/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailsController>(DetailsController());
  }
}
