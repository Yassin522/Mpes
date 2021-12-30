import 'package:flutter/material.dart';
import 'package:mpes/view/modules/addproduct/add_product.dart';
import 'package:mpes/view/modules/profile/profile_screen.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:mpes/view/shared/components/constants.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (
      
      currentIndex: currentIndex,
      
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });

        if (currentIndex == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        }

         if (currentIndex == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProduct(),
            ),
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart),
          label: "Add",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Me",
        ),
      ],
    );
  }
}
