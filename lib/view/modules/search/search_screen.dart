import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/search/search_controller.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/material_button.dart';
import 'package:mpes/view/shared/components/text_field_container.dart';

List<String> defaultList = ['Fruite', 'Meat', 'Clothes', 'Vegetables', 'Food'];

class Search extends StatelessWidget {
  var controller = Get.put(SearchController());
  final _basicDetailFormKey = GlobalKey<FormState>();
  final TextEditingController NameFieldController = TextEditingController();

  void openFilterDialog(context) async {
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
  }

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
                          controller: NameFieldController,
                          keyboardType: TextInputType.name,
                          onChanged: (String vlue) {},
                          validator: (value) {
                            if (NameFieldController.text.isEmpty) {
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
                      Materialbutton(
                        text: "Choosetype",
                        press: () {
                          openFilterDialog(context);
                        },
                        color: kPrimaryColor,
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
}
