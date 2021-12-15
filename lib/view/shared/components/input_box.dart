import 'package:flutter/material.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';

class Inputbox extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const Inputbox({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kPrimaryColor2 = kPrimaryColor;
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return 'email address must not be empty';
          }
          return null;
        },
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor2,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
