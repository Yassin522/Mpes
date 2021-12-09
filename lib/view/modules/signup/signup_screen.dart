import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/login/login_screen.dart';
import 'package:mpes/view/modules/signup/signup_back.dart';
import 'package:mpes/view/shared/components/already_have_account.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/input_box.dart';
import 'package:mpes/view/shared/components/material_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(
        child: Center(
          child: SingleChildScrollView(
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
                Inputbox(
                  hintText: "Username",
                  icon: Icons.person,
                  onChanged: (value) {},
                ),
                Inputbox(
                  hintText: "Your Email",
                  icon: Icons.email,
                  onChanged: (value) {},
                ),
                Inputbox(
                  hintText: "Password",
                  icon: Icons.lock,
                  onChanged: (value) {},
                ),
                Materialbutton(
                  text: "SIGNUP",
                  color: kPrimaryColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
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
    );
  }
}
