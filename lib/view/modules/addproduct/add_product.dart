import 'dart:io';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/addproduct/add_product_controller.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:expandable/expandable.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body: AddBody(),
    );
  }
}

class AddBody extends StatefulWidget {
  @override
  State<AddBody> createState() => _AddBodyState();
}

class _AddBodyState extends State<AddBody> {
  File? pickedFile;
  ImagePicker imagepicker = ImagePicker();

  final _basicDetailFormKey = GlobalKey<FormState>();
  final _uploadimagekey = GlobalKey<FormState>();

  final TextEditingController titleFieldController = TextEditingController();

  final TextEditingController priceFieldController = TextEditingController();

  final TextEditingController discountPriceController = TextEditingController();

  final TextEditingController typeFieldController = TextEditingController();

  final TextEditingController dateFieldController = TextEditingController();

  final TextEditingController quantityFieldController = TextEditingController();

  final TextEditingController phoneFieldController = TextEditingController();

  AddproductController addproductController = Get.put(AddproductController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: _basicDetailFormKey,
                child: Column(
                  children: [
                    Text(
                      "Fill Product Details",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: titleFieldController,
                        keyboardType: TextInputType.name,
                        onChanged: (String vlue) {},
                        validator: (value) {
                          if (titleFieldController.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, Potato",
                          labelText: "Product Name",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: priceFieldController,
                        keyboardType: TextInputType.number,
                        onChanged: (String vlue) {},
                        validator: (value) {
                          if (priceFieldController.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 255",
                          labelText: "Original Price",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: typeFieldController,
                        keyboardType: TextInputType.name,
                        onChanged: (String vlue) {},
                        validator: (value) {
                          if (typeFieldController.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, Fruite",
                          labelText: "Product Type",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: dateFieldController,
                        keyboardType: TextInputType.name,
                        onChanged: (String vlue) {},
                        validator: (value) {
                          if (dateFieldController.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 23-12-2022",
                          labelText: "Expiration date",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: quantityFieldController,
                        keyboardType: TextInputType.number,
                        onChanged: (String vlue) {},
                        validator: (value) {
                          if (quantityFieldController.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: "Quantity",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: phoneFieldController,
                        keyboardType: TextInputType.number,
                        onChanged: (String vlue) {},
                        validator: (value) {
                          if (phoneFieldController.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: " Phone number",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Form(
                      key: _uploadimagekey,
                      child: ExpansionTile(
                        maintainState: true,
                        title: Text(
                          "Upload Image",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                        leading: Icon(
                          Icons.image,
                          color: Colors.red,
                        ),
                        childrenPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        children: [
                          InkWell(
                            child: Icon(Icons.add_a_photo),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => bottomsheet(context));
                            },
                          ),
                          SizedBox(height: 5),
                          Obx(
                            () => SizedBox(
                              height: 80,
                              width: 200,
                              child: Image(
                                image: FileImage(File(addproductController
                                    .productPicPath.value)) as ImageProvider,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Materialbutton(
                      text: "Submit",
                      press: () {
                        if (_basicDetailFormKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Successfully Submitted"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Invalid info"),
                            ),
                          );
                        }
                      },
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomsheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Text(
            "Choose Product Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
              SizedBox(width: 80),
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.camera),
                    SizedBox(height: 5),
                    Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagepicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    addproductController.setProfileImagePath(pickedFile!.path);
    // Get.back();
  }
}
