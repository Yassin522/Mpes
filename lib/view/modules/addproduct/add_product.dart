import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mpes/config/user_information.dart';
import 'package:mpes/view/models/Discount.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
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
  XFile? _image;
  late String _title;
  late var _price;
  late String _date;
  late var _quantity;
  late var _phone;
  late String _type;
  late var _discount1;
  late String _discountDate1;
  late var _discount2;
  late String _discountDate2;
  late var _discount3;
  late String _discountDate3;
  final discounts = <Discount>[];

  ImagePicker imagepicker = ImagePicker();

  final _basicDetailFormKey = GlobalKey<FormState>();
  final _uploadimagekey = GlobalKey<FormState>();

  var title = TextEditingController();
  var price = TextEditingController();
  var type = TextEditingController();
  var date = TextEditingController();
  var quantity = TextEditingController();
  var discount1 = TextEditingController();
  var discountDate1 = TextEditingController();
  var discount2 = TextEditingController();
  var discountDate2 = TextEditingController();
  var discount3 = TextEditingController();
  var discountDate3 = TextEditingController();
  var phone = TextEditingController();

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
                        controller: title,
                        keyboardType: TextInputType.name,
                        onChanged: ((String name) {
                          setState(() {
                            _title = name;
                            print(_title);
                          });
                        }),
                        validator: (value) {
                          if (title.text.isEmpty) {
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
                        controller: date,
                        keyboardType: TextInputType.name,
                        onChanged: ((String name) {
                          setState(() {
                            _date = name;
                            print(_date);
                          });
                        }),
                        validator: (value) {
                          if (date.text.isEmpty) {
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
                        controller: price,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: ((String name) {
                          setState(() {
                            _price = name;
                          });
                        }),
                        validator: (value) {
                          if (price.text.isEmpty) {
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
                        controller: type,
                        keyboardType: TextInputType.name,
                        onChanged: ((String name) {
                          setState(() {
                            _type = name;
                            print(_type);
                          });
                        }),
                        validator: (value) {
                          if (type.text.isEmpty) {
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
                        controller: quantity,
                        keyboardType: TextInputType.number,
                        onChanged: ((String name) {
                          setState(() {
                            _quantity = name;
                            print(_quantity);
                          });
                        }),
                        validator: (value) {
                          if (quantity.text.isEmpty) {
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
                    SizedBox(height: 5),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: discount1,
                        keyboardType: TextInputType.number,
                        onChanged: ((String name) {
                          setState(() {
                            _discount1 = name;

                            print(_discount1);
                          });
                        }),
                        validator: (value) {
                          if (discount1.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: "Discount1",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: discountDate1,
                        keyboardType: TextInputType.text,
                        onChanged: ((String name) {
                          setState(() {
                            _discountDate1 = name;
                            print(_discountDate1);
                          });
                        }),
                        validator: (value) {
                          if (discountDate1.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: "Discount date 1",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: discount2,
                        keyboardType: TextInputType.number,
                        onChanged: ((String name) {
                          setState(() {
                            _discount2 = name;
                            print(_discount1);
                          });
                        }),
                        validator: (value) {
                          if (discount2.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: "Discount1",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: discountDate2,
                        keyboardType: TextInputType.text,
                        onChanged: ((String name) {
                          setState(() {
                            _discountDate2 = name;
                            print(_discountDate2);
                          });
                        }),
                        validator: (value) {
                          if (discountDate2.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: "Discount date 2",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: discount3,
                        keyboardType: TextInputType.number,
                        onChanged: ((String name) {
                          setState(() {
                            _discount3 = name;
                            print(_discount1);
                          });
                        }),
                        validator: (value) {
                          if (discount3.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: "Discount3",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: discountDate3,
                        keyboardType: TextInputType.text,
                        onChanged: ((String name) {
                          setState(() {
                            _discountDate3 = name;
                            print(_discountDate3);
                          });
                        }),
                        validator: (value) {
                          if (discountDate3.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: "e.g, 20",
                          labelText: "Discount date 3",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
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

                          //Image.file(File(_image.path)),
                        ],
                      ),
                    ),
                    Materialbutton(
                      text: "Submit",
                      press: () {
                        if (_basicDetailFormKey.currentState!.validate()) {
                          print("okk");
                          submitSubscription();
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

                  // Navigator.pop(context);
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
                  Navigator.pop(context);
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

    try {
      setState(() {
        _image = pickedImage;
        print("ggggggggggggggggg");
        // Navigator.pop(context);
      });
    } catch (e) {
      print(e);
      print(pickedImage.runtimeType);
      print("noloooooooooooooooooooooooo");
    }

    // Get.back();
  }

  Future<void> submitSubscription() async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://d3fcb1cc-1dff-43b7-b377-748fda02bbc0.mock.pstmn.io/api/add"),
    );

    /*  Map<String,String> headers={
      "Authorization":"Bearer $token",
      "Content-type": "multipart/form-data"
    };*/

    XFile? _image2 = _image;
    if (_image2 != null) {
      var multipartFile =
          await http.MultipartFile.fromPath("image", _image2.path);
      request.files.add(multipartFile);
      print("ttttttttttttt");
      print(_image2.path);
    }

    Discount discounta =
        Discount(discountDate: _discountDate1, discount: _discount1);
    Discount discountb =
        Discount(discountDate: _discountDate2, discount: _discount2);
    Discount discountc =
        Discount(discountDate: _discountDate3, discount: _discount3);

    discounts.add(discounta);
    discounts.add(discountb);
    discounts.add(discountc);

    print(discounts[0].discountDate);

    print("uuuuuuuuuuuuuuuuuuuuuu");
    request.fields["product_name"] = _title;
    request.fields["expiry_date"] = _date;
    request.fields["price"] = _price;
    request.fields["amount_products"] = _quantity;
    request.fields["type"] = _type;
    request.fields["user_id"] = UserInformation.User_Id.toString();
    request.fields["discounts"] = discounts.toString();
    print(discounts.toString());
    //request.headers.addAll(headers);
    print(request);
    print("request: " + request.toString());
    var res = await request.send();
    print("This is response:" + res.toString());
  final respStr = await res.stream.bytesToString();
   print(respStr);
  }
}
