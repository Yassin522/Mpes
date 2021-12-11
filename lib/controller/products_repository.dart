import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsRepository {
  var url = "C:/Users/Yassin52/Desktop/Tests/products.json";
  loadProductsFromApi() async {
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
