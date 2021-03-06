import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mpes/config/config_server.dart';
import 'package:mpes/view/models/user.dart';

class SignupService {
  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);

  Future<bool> register(User user) async {
    var response = await http.post(
      url,
      headers: {},
      body: {
        'user_name': user.username,
        'email_app': user.email,
        'password': user.password
      },
    );
    print(response.body);

    if (response.statusCode >= 200) {
      var jsonResponse = jsonDecode(response.body);
      message = 'success signup';
      return true;
    } else {
      var jsonResponse = jsonDecode(response.body);
      message = 'error info';
      return false;
    }
  }
}
