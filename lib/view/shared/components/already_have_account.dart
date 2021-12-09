import 'package:flutter/material.dart';
import 'package:mpes/view/shared/components/constants.dart';

class CheckAlreadyHaveAccount extends StatelessWidget {
  final bool login;
  final Function press;

  const CheckAlreadyHaveAccount({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ?" : "Already have an Account ?",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        GestureDetector(
          onTap: () => press(),
          child: Text(
            login ? "Sign Up" : "Sign in",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
