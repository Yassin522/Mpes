import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mpes/view/models/Products.dart';
import 'package:mpes/view/modules/details/details_screen.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/homeComponants/categories.dart';
import 'package:mpes/view/shared/components/homeComponants/one_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: GridView.builder(
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
          ),
        ),
      ],
    );
  }
}
