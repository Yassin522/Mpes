import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/details/details_body.dart';
import 'package:mpes/view/shared/components/constants.dart';

class DetailsScreen extends StatelessWidget {
  final product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: DetailsBody(
          product: product,
        ),
      ),
    );
  }
}
