import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:mpes/config/config_server.dart';
import 'package:mpes/view/models/Categories.dart';
import 'package:mpes/view/models/Products.dart';

class HomeService {
  var message;
  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.sortingByType);

  var url2 =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.getProducts);

  Future<List<Category>> getCategories(String id) async {
    var response = await http.get(url, headers: {});

    if (response.statusCode == 200) {
      var categories = categoriesFromJson(response.body);
      return categories.categories;
    } else
      return [];
  }

  Future<List<Product>> getProducts() async {
    var response = await http.get(url2, headers: {});

    if (response.statusCode == 200) {
      print(response.body);
      List<Product> products = productFromJson(response.body);
      return products;
    } else {
      print("bbb");
      return [];
    }
  }

  loadProductsFromApi() async {
    var response = await http.get(url2);
    //List<Product> products = productFromJson(response.body);
    return jsonDecode(response.body);
  }

  Future<bool> addLike(int id) async {
    print(id);
    var response = await http.post(
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig.addLike + id.toString()),
      headers: {},
      body: {},
    );
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      message = 'log in success';
      return true;
    } else {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['error']);
      message = 'server error';
      return false;
    }
  }

  loadCategoriesFromApi(int catIndex) async {
    print(catIndex);
    var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer +
            ServerConfig.sortingByCategory +
            catIndex.toString()),
        headers: {});
    //List<Product> products = productFromJson(response.body);
    return jsonDecode(response.body);
  }
}
