import 'package:get/get.dart';
import 'package:mpes/view/models/user.dart';
import 'package:mpes/view/modules/login/login_service.dart';

class LoginController extends GetxController {
  var email = '';
  var password = '';

  var loginStatus = false;
  var message;

  LoginService service = LoginService();

  Future<void> loginOnclick() async {
    User user = User(
      email: email,
      password: password,
    );
    loginStatus = await service.login(user);
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    }
  }
}
