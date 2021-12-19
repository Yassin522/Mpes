import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/signup/signup_screen.dart';
import 'package:mpes/view/shared/components/already_have_account.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/input_box.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';

// ignore: must_be_immutable
class Loginback extends StatelessWidget {
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
          /*Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/login_bottom.png"),
            width: size.width * 0.4,
          ),*/
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
                    /*SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),*/
                    Image.asset('assets/images/welcome.jpg'),
                    Inputbox(
                      hintText: "Your Email",
                      onChanged: (value) {},
                      icon: Icons.person,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        onChanged: (String value) {
                            
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
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
}
