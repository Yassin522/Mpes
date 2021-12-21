import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/login/login_controller.dart';
import 'package:mpes/view/modules/signup/signup_screen.dart';
import 'package:mpes/view/shared/components/already_have_account.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/input_box.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';

// ignore: must_be_immutable
class Loginback extends StatelessWidget {
  LoginController controller = Get.find();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/main_top.png"),
            width: size.width * 0.3,
          ),
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Image.asset('assets/images/welcome.jpg'),
                    Inputbox(
                      hintText: "Your Email",
                      onChanged: (String value) {
                        controller.email = value;
                      },
                      icon: Icons.person,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        onChanged: (String value) {
                          controller.password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password must not be empty';
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
                      text: "LOGIN",
                      press: () {
                        if (formKey.currentState!.validate()) {
                          OnClickLogin();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Successfully logged in"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Invalid username or password"),
                            ),
                          );
                        }
                      },
                      color: kPrimaryColor,
                    ),
                    CheckAlreadyHaveAccount(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void OnClickLogin() async {
    EasyLoading.show(status: 'loading...');
    await controller.loginOnclick();
    if (controller.loginStatus) {
      EasyLoading.showSuccess(controller.message);
      print('success');
      Get.offAllNamed('/Home');
    } else {
      EasyLoading.showError(controller.message,
          duration: Duration(seconds: 2), dismissOnTap: true);
    }
  }
}
