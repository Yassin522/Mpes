import 'package:http/http.dart' as http;
import 'package:mpes/config/config_server.dart';
import 'dart:convert';

class SearchService {
  var message;

  LoadNameFromApi(String name) async {
    var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer +
            ServerConfig.searchByName +
            name),
        headers: {});

    print(response.body);
    print("nnnnnn");
    return jsonDecode(response.body);
  }

  LoadTypeFromApi(String name) async {
    var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer +
            ServerConfig.searchByType +
            name),
        headers: {});

    print(response.body);
    print("nnnnnn");
    return jsonDecode(response.body);
  }

  LoadExpiredFromApi(String name) async {
    var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer +
            ServerConfig.searchByExpiry_date +
            name),
        headers: {});

    print(response.body);
    print("nnnnnn");
    return jsonDecode(response.body);
  }



}
