import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mpes/getx_bindings/add_product_binding.dart';
import 'package:mpes/getx_bindings/home_binding.dart';
import 'package:mpes/getx_bindings/login_binding.dart';
import 'package:mpes/getx_bindings/signup_binding.dart';
import 'package:mpes/getx_bindings/welcome_binding.dart';
import 'package:mpes/view/modules/addproduct/add_product.dart';
import 'package:mpes/view/modules/details/details_screen.dart';
import 'package:mpes/view/modules/home/home_screen.dart';
import 'package:mpes/view/modules/login/login_screen.dart';
import 'package:mpes/view/modules/profile/profile_screen.dart';
import 'package:mpes/view/modules/signup/signup_screen.dart';
import 'package:mpes/view/modules/welcome/welcome_screen.dart';
import 'package:mpes/view/shared/components/constants.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/Welcome',
    getPages: [
      GetPage(
          name: '/Welcome',
          page: () => WelcomeScreen(),
          binding: WelcomeBinding()),
      GetPage(
          name: '/Login', page: () => LoginScreen(), binding: LoginBinding()),
      GetPage(name: '/Signup', page: () => SignUp(), binding: SignupBinding()),
      GetPage(
          name: '/Profile',
          page: () => ProfileScreen(),
          binding: LoginBinding()),
      GetPage(name: '/Home', page: () => HomeScreen(), binding: HomeBinding()),
      GetPage(
          name: '/Add', page: () => AddProduct(), binding: AddproductBinding()),
      GetPage(
          name: '/Search',
          page: () => AddProduct(),
          binding: AddproductBinding()),
    ],
    builder: EasyLoading.init(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
