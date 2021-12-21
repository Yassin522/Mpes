import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/controller/products_controller.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/details/details_screen.dart';
import 'package:mpes/view/modules/home/home_controller.dart';
import 'package:mpes/view/shared/components/homeComponants/categories.dart';
import 'package:mpes/view/shared/components/homeComponants/one_item.dart';

class Body extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

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
          child: Obx(() {
            if (_homeController.loading.value == true) {
              return Center(child: CircularProgressIndicator());
            }
            if (_homeController.productss.isEmpty == true) {
              return Center(child: Text('No products found'));
            } else
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: GridView.builder(
                  itemCount: _homeController.productss.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 28,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 28,
                  ),
                  itemBuilder: (context, index) => Productbuilder(
                    product: _homeController.productss[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: _homeController.productss[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
          }),
        ),
      ],
    );
  }
}
