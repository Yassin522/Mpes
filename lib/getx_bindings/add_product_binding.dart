import 'package:get/get.dart';
import 'package:mpes/view/modules/addproduct/add_product_controller.dart';

class AddproductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddproductController>(AddproductController());
    // TODO: implement dependencies
  }
}
