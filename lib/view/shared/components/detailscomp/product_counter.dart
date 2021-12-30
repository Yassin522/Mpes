import 'package:flutter/material.dart';
import 'package:mpes/view/shared/components/constants.dart';

class ProductCounter extends StatelessWidget {

  final product;

  const ProductCounter({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: FloatingActionButton(
            onPressed: () {
             
            },
            child: Icon(Icons.remove),
            backgroundColor: kPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            product["amount_products"].toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: FloatingActionButton(
            onPressed: () {
           
            },
            child: Icon(Icons.add),
            backgroundColor: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
