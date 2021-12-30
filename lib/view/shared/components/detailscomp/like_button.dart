import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mpes/view/shared/components/detailscomp/product_counter.dart';

class LikeButtonn extends StatelessWidget {
  final product;
  const LikeButtonn({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ProductCounter(
          product: product,
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            "assets/icons/heart.svg",
          ),
        ),
      ],
    );
  }
}
