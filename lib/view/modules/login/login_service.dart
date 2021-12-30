import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mpes/config/config_server.dart';
import 'package:mpes/config/user_information.dart';
import 'package:mpes/view/models/user.dart';

class LoginService {
  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);
  var ID;

  Future<bool> login(User user) async {
    print(user.email);
    print(user.password);
    var response = await http.post(
      url,
      headers: {},
      body: {'email_app': user.email, 'password': user.password},
    );

    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      ID = jsonResponse['id'];
      UserInformation.User_Id = ID;
      GetStorage storage = GetStorage();
      await storage.write('id', UserInformation.User_Id);
      message = 'log in success';
      return true;
    } else {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['error']);
      message = 'server error';
      return false;
    }
  }
}
