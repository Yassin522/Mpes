import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/login/login_screen.dart';
import 'package:mpes/view/modules/signup/signup_back.dart';
import 'package:mpes/view/shared/components/already_have_account.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/input_box.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';

class SignUp extends StatelessWidget {
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
                      onChanged: (String vlue) {},
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
                      onChanged: (String vlue) {},
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
                      onChanged: (String vlue) {},
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
                    text: "SIGNUP",
                    color: kPrimaryColor,
                    press: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Successfully Sign in"),
                          ),
                        );
                      }
                    },
                  ),
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
}
