import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/login/login_back.dart';
import 'package:mpes/view/modules/login/login_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loginback(),
    );
  }
}
