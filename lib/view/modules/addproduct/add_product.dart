import 'package:flutter/material.dart';
import 'package:mpes/view/shared/components/constants.dart';

class AddProduct extends StatelessWidget {
  final _basicDetailFormKey = GlobalKey<FormState>();

  final TextEditingController titleFieldController = TextEditingController();
  final TextEditingController priceFieldController = TextEditingController();
  final TextEditingController discountPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Fill Product Details",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: _basicDetailFormKey,
                  child: ExpansionTile(
                    maintainState: true,
                    title: Text(
                      "Basic Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(
                      Icons.shop,
                      color: kPrimaryColor,
                    ),
                    childrenPadding: EdgeInsets.symmetric(vertical: 10),
                    children: [
                      TextFormField(
                        controller: titleFieldController,
                        keyboardType: TextInputType.name,
                        validator: (_) {
                          if (titleFieldController.text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, Furnature",
                          labelText: "Product Title",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: priceFieldController,
                        keyboardType: TextInputType.number,
                        validator: (_) {
                          if (priceFieldController.text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 255",
                          labelText: "Original Price",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: discountPriceController,
                        keyboardType: TextInputType.number,
                        validator: (_) {
                          if (discountPriceController.text.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 243",
                          labelText: "Discount Price",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
