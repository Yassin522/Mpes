import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class ProductsRepository {
  var url = "https://json-generator.com/api/json/get/bYKKPeXRcO?indent=2#";
  loadProductsFromApi() async {
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
