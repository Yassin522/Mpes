import 'dart:ui';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mpes/view/layout/home_layout.dart';
import 'package:mpes/view/modules/home/body.dart';
import 'package:mpes/view/modules/home/home_controller.dart';
import 'package:mpes/view/modules/search/search_controller.dart';
import 'package:mpes/view/modules/search/search_screen.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/detailscomp/product_counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  

   final HomeController homeController = Get.find();
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back.svg"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              "MPES Shop",
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                color: kTextColor,
              ),
              onPressed: () {
                Get.to(Search());
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        bottomNavigationBar: HomeLayout(),
        body:  Body(),
      ),
    );
  }
}
