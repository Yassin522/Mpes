import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/details/details_screen.dart';
import 'package:mpes/view/modules/home/home_controller.dart';
import 'package:mpes/view/shared/components/homeComponants/categories.dart';
import 'package:mpes/view/shared/components/homeComponants/one_item.dart';

class Body extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Categories(),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: Obx(
            () {
              if (homeController.catIndex.value == 0) {
                if (homeController.isLoading2.value == true) {
                  return Center(child: CircularProgressIndicator());
                }
                if (homeController.productss.isEmpty == true) {
                  return Center(child: Text('No products found'));
                } else
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: GridView.builder(
                      itemCount: homeController.productss.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 28,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 28,
                      ),
                      itemBuilder: (context, index) => Productbuilder(
                        // product: _homeController.productss[index],
                        product: homeController.productss[index],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: homeController.productss[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
              }

              else{
                 if (homeController.isLoading3.value == true) {
                  return Center(child: CircularProgressIndicator());
                }
                if (homeController.categories.isEmpty == true) {
                  return Center(child: Text('No products found'));
                } else
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: GridView.builder(
                      itemCount: homeController.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 28,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 28,
                      ),
                      itemBuilder: (context, index) => Productbuilder(
                        // product: _homeController.productss[index],
                        product: homeController.categories[index],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: homeController.categories[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
