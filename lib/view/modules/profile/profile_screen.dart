import 'package:flutter/material.dart';
import 'package:mpes/view/modules/profile/profile_body.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/profilecomp/header_container.dart';
import 'package:mpes/view/shared/components/profilecomp/text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ProfileBody(),
    );
  }
}
