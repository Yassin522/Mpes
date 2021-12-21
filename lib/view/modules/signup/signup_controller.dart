import 'package:get/get.dart';
import 'package:mpes/view/models/user.dart';
import 'package:mpes/view/modules/signup/signup_service.dart';

class SignupController extends GetxController {
  var username = '';
  var email = '';
  var password = '';

  var signupStatus = false;
  var message;

  SignupService service = SignupService();
  Future<void> registerOnclick() async {
    User user = User(
      username: username,
      email: email,
      password: password,
    );
    signupStatus = await service.register(user);
    message = service.message;
    print(message);
    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    }
  }
}
