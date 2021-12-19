import 'package:get/get.dart';

class AddproductController extends GetxController {
  var isProductPicPathset = false.obs;
  var productPicPath = "".obs;

  void setProfileImagePath(String path) {
    productPicPath.value = path;
    isProductPicPathset.value = true;
  }
}
