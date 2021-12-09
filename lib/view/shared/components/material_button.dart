import 'package:flutter/material.dart';
import 'package:mpes/view/shared/components/constants.dart';

class Materialbutton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;

  const Materialbutton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
          color: color,
          onPressed: () => press(),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
