import 'package:get/get.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/home/home_service.dart';

class HomeController extends GetxController {
  HomeService _homeService = HomeService();
  RxBool loading = false.obs;
  RxBool loading2 = false.obs;
  var subtotal = 0.obs;
  var cartItem = [];
  var showGrid = false.obs;
  List productss = [].obs;

  HomeController() {
    loadProductsFromRepo();
    loadCartFromApi();
  }

  loadProductsFromRepo() async {
    loading(true);
    productss = await _homeService.loadProductsFromApi();
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }

  loadCartFromApi() async {
    loading(true);
    var productsList = await _homeService.loadCartFromApi();

    for (var i = 0; i < productsList.length; i++) {
      var product =
          await _homeService.getProductFromApi(productsList[i]["productId"]);
      cartItem.add({"product": product, "price": productsList[i]["price"]});
    }

    loading(false);
  }
}
