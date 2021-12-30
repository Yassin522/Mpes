import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/search/search_body.dart';
import 'package:mpes/view/modules/search/search_controller.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';

List<String> defaultList = ['Fruite', 'Meat', 'Clothes', 'Vegetables', 'Food'];

class Search extends StatelessWidget {
  SearchController controller = Get.put(SearchController());

  final _basicDetailFormKey = GlobalKey<FormState>();
  // final TextEditingController NameFieldController = TextEditingController();

  /*void openFilterDialog(context) async {
    await FilterListDialog.display<String>(context,
        listData: defaultList,
        selectedListData: controller.getSelectedList(),
        headlineText: 'Choose Type',
        closeIconColor: kPrimaryLightColor,
        applyButtonTextStyle: TextStyle(fontSize: 20),
        searchFieldHintText: "Search Here",
        selectedTextBackgroundColor: kPrimaryColor,
        applyButonTextBackgroundColor: Colors.green,
        choiceChipLabel: (item) => item,
        validateSelectedItem: (list, val) => list!.contains(val),
        onItemSearch: (list, text) {
          if (list!.any((element) =>
              element.toLowerCase().contains(text.toLowerCase()))) {
            return list
                .where((element) =>
                    element.toLowerCase().contains(text.toLowerCase()))
                .toList();
          } else
            return [];
        },
        onApplyButtonClick: (list) {
          controller.setSelectedList(List<String>.from(list!));
          Navigator.of(context).pop();
        });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Search"),
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Form(
                key: _basicDetailFormKey,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      TextFieldContainer(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (String value) {
                            controller.productName = value;
                          },
                          validator: (value) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: "e.g, samsung",
                            labelText: "Product Name",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (String value) {
                            controller.productType = value;
                          },
                          validator: (value) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: "e.g, phone",
                            labelText: "Product Type",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (String value) {
                            controller.productExpired = value;
                          },
                          validator: (value) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: "e.g, 2022-02-02",
                            labelText: "Product Expired Date",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Materialbutton(
                        text: "Submit",
                        press: () {
                          if (_basicDetailFormKey.currentState!.validate()) {
                            OnClickExpired(controller.productExpired);
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
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void OnClickName(String name) async {
    await controller.loadSearchByName(name);

    if (controller.searchStatus1) {
      Get.to(SearcBody());
    }
  }

  void OnClickType(String name) async {
    await controller.loadSearchByType(name);
    if (controller.searchStatus2) {
      Get.to(SearcBody());
    }
  }
  void OnClickExpired(String name) async {
    await controller.loadSearchByExpired(name);
    if (controller.searchStatus3) {
      Get.to(SearcBody());
    }
  }
}
