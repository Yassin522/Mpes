import 'package:flutter/material.dart';
import 'package:mpes/view/shared/components/constants.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({Key? key}) : super(key: key);

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int numOfProducts = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: FloatingActionButton(
            onPressed: () {
              if (numOfProducts >= 1) {
                setState(() {
                  numOfProducts--;
                });
              }
            },
            child: Icon(Icons.remove),
            backgroundColor: kPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            numOfProducts.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                numOfProducts++;
              });
            },
            child: Icon(Icons.add),
            backgroundColor: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
