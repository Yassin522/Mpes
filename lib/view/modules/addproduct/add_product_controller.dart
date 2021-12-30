import 'dart:io';

import 'package:get/get.dart';
import 'package:mpes/view/models/Discount.dart';

class AddproductController extends GetxController {
  var isProductPicPathset = false.obs;
  var productPicPath = "".obs;
  var _title = ''.obs;
  var _price = ''.obs;
  var _date = ''.obs;
  var _quantity = ''.obs;
  var _phone = ''.obs;
  var _type = ''.obs;
  var _discount1 = ''.obs;
  var _discountDate1 = ''.obs;
  var _discount2 = ''.obs;
  var _discountDate2 = ''.obs;
  var _discount3 = ''.obs;
  var _discountDate3 = ''.obs;
  List<Discount> discounts = [];

  void setProfileImagePath(String path) {
    productPicPath.value = path;
    isProductPicPathset.value = true;
  }
}
