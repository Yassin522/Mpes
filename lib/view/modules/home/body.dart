import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/controller/products_controller.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/details/details_screen.dart';
import 'package:mpes/view/shared/components/homeComponants/categories.dart';
import 'package:mpes/view/shared/components/homeComponants/one_item.dart';

class Body extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());

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
          child: /*productsController.loading.value
              ? Center(child: CircularProgressIndicator())
              : products.isEmpty
                  ? Center(
                      child: Text("No products found"),
                    )
                  :*/
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: /*productsController.showGrid.value
                          ?*/
                GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 28,
                childAspectRatio: 0.75,
                crossAxisSpacing: 28,
              ),
              itemBuilder: (context, index) => Productbuilder(
                product: products[index],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            /*: Center(
                              child: Text("No products found"),
                            )*/
          ),
        ),
      ],
    );
  }
}
