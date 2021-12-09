import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/detailscomp/like_button.dart';
import 'package:mpes/view/shared/components/detailscomp/product_counter.dart';
import 'package:mpes/view/shared/components/detailscomp/product_title_deatils.dart';

class DetailsBody extends StatelessWidget {
  final Product product;
  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.14,
                    left: 22,
                    right: 22,
                  ),
                  //height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            product.description,
                            style: TextStyle(height: 1.8),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      LikeButton(),
                    ],
                  ),
                ),
                DetailsTitle(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
