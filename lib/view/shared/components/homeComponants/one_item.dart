import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/home/home_controller.dart';
import 'package:mpes/view/shared/components/constants.dart';

class Productbuilder extends StatelessWidget {
  final HomeController homeController = Get.find();
  final product;
  final Function press;
  Productbuilder({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                  fit: BoxFit.fill,
                ),
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Center(
            child: Text(
              product["product_name"],
              style: TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Center(
            child: Text(
              "\$${product["price"]}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
