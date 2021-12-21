import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mpes/config/config_server.dart';

class HomeService {
  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.showproducts);
  var url2 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.product);

  loadProductsFromApi() async {
    var response = await http.get(url, headers: {});
    return jsonDecode(response.body);
  }

  loadCartFromApi() async {
    var response = await http.get(url, headers: {});
    var productsjson = jsonDecode(response.body);
    return productsjson["products"];
  }

  Future getProductFromApi(productId) async {
    var response = await http.get(url2, headers: {});
    return jsonDecode(response.body);
  }
}
