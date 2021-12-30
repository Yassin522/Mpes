import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/login/login_screen.dart';
import 'package:mpes/view/modules/signup/signup_back.dart';
import 'package:mpes/view/modules/signup/signup_controller.dart';
import 'package:mpes/view/shared/components/already_have_account.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/input_box.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignupController controller = Get.put(SignupController());
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SIGNUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.3,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      onChanged: (String value) {
                        controller.username = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                      return 'Username must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                        icon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      onChanged: (String value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        icon: Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      onChanged: (String value) {
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Materialbutton(
                      text: "Create account",
                      color: kPrimaryColor,
                      press: () {
                        if (formKey.currentState!.validate()) {
                          OnClickRegister();
                        }
                      }),
                  CheckAlreadyHaveAccount(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void OnClickRegister() async {
    EasyLoading.show(status: 'loading...');
    await controller.registerOnclick();
    if (controller.signupStatus) {
      EasyLoading.showSuccess(controller.message);
      Get.offNamed('/Login');
    } else {
      EasyLoading.showError(controller.message,
          duration: Duration(seconds: 2), dismissOnTap: true);
    }
  }
}
