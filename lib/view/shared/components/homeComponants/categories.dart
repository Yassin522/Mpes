import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/home/home_controller.dart';
import 'package:mpes/view/modules/home/home_service.dart';
import 'package:mpes/view/shared/components/constants.dart';

class Categories extends StatelessWidget {
  List<String> categories = ["All", "Furniture", "Fruite", "Food", "Meat"];

  final HomeController homeController = Get.find();

  HomeService homeService = HomeService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => Obx(() => buildCategory(index)),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        homeController.ChangeCategories(index);
        print("okk");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: homeController.catIndex.value == index
                    ? kTextColor
                    : kTextLightColor,
              ),
            ),
            Container(
              height: 2,
              width: 35,
              color: homeController.catIndex.value == index
                  ? Colors.black
                  : Colors.transparent,
              margin: EdgeInsets.only(top: 5),
            ),
          ],
        ),
      ),
    );
  }
}
