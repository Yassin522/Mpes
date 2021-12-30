import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/home/home_controller.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/detailscomp/like_button.dart';
import 'package:mpes/view/shared/components/detailscomp/product_counter.dart';
import 'package:mpes/view/shared/components/detailscomp/product_title_deatils.dart';
import 'package:mpes/view/shared/components/input_box.dart';

class DetailsBody extends StatelessWidget {
  final product;
  DetailsBody({Key? key, required this.product}) : super(key: key);
  HomeController homeController = Get.find();
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
                  margin: EdgeInsets.only(top: size.height * 0.33),
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
                            product["type"],
                            style: TextStyle(height: 1.8),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        children: <Widget>[
                          ProductCounter(
                            product: product,
                          ),
                          Obx(() {
                            return Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: LikeButton(
                                onTap: OnClickDecrease,
                                likeCount: product["num_likes"],
                                size: 35,
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor: kPrimaryColor,
                                  dotSecondaryColor: kPrimaryLightColor,
                                ),
                                circleColor: CircleColor(
                                  start: kPrimaryColor,
                                  end: kPrimaryLightColor,
                                ),
                              ),
                            );
                          },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Inputbox(
                        hintText: "Write Comment",
                        icon: Icons.comment,
                        onChanged: (value) {},
                      ),
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

  Future<bool?> OnClickDecrease(bool isLiked) async {
    print("sssss");
    int id = product["id"];
    print(id);
    homeController.addLikeOnClick(id);
    if (homeController.addStatus) {
      print('success');
      return !isLiked;
    } else {
      print("error");
      return !isLiked;
    }
  }
}
