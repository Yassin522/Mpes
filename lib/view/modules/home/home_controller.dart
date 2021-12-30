import 'package:get/get.dart';
import 'package:mpes/config/config_server.dart';
import 'package:mpes/config/user_information.dart';
import 'package:mpes/view/models/Categories.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/home/home_service.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeService homeService = HomeService();
  List<Category> categoriesList = [];
  List<Product> products = [];
  List productss = [].obs;
  List categories = [].obs;
  var isLoading = true.obs;
  var isLoading2 = true.obs;
  var isLoading3 = true.obs;
  var catIndex = 0.obs;
  var addStatus;
  var message;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    //categoriesList = await homeService.getCategories(UserInformation.User_Id);
    // products = await homeService.getProducts();
    productss = await homeService.loadProductsFromApi();
    await loadCategories(catIndex.value);
    //print(productss);
    isLoading3(false);
    isLoading(false);
    isLoading2(false);

    super.onReady();
  }

  Future<void> addLikeOnClick(int id) async {
    print(id);
    addStatus = await homeService.addLike(id);
    message = homeService.message;
    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    }
  }

  loadCategories(int catIndex) async {
    isLoading3(true);
    categories = await homeService.loadCategoriesFromApi(catIndex);
    isLoading3(false);
  }

  ChangeCategories(index) {
    catIndex(index);
    loadCategories(index);
  }
}
