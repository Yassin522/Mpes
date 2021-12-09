import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mpes/view/modules/login/login_screen.dart';
import 'package:mpes/view/modules/signup/signup_screen.dart';
import 'package:mpes/view/shared/components/background.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/material_button.dart';

class WelBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to MPES",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            width: size.width * 0.7,
          ),
          SizedBox(
            height: 3.0,
          ),
          Materialbutton(
            text: "LOGIN",
            color: kPrimaryColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
          Materialbutton(
            text: "SIGNUP",
            color: kPrimaryLightColor,
            textColor: Colors.black,
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
    );
  }
}
