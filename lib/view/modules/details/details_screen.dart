import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: product.color,
        appBar: AppBar(
          backgroundColor: product.color,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
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
