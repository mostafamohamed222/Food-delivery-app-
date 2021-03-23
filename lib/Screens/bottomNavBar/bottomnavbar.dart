import 'package:FoodDeliveryApp/Screens/bottomNavBar/HomeScreen.dart';
import 'package:FoodDeliveryApp/Screens/bottomNavBar/bookmark.dart';
import 'package:FoodDeliveryApp/Screens/bottomNavBar/proflie.dart';
import 'package:FoodDeliveryApp/Screens/bottomNavBar/search.dart';
import 'package:FoodDeliveryApp/Screens/bottomNavBar/shoppingcart.dart';
import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BottomNavBar extends StatefulWidget {
  static String id = "/bottomNavBar";

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Book Mark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "proflie",
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
      body: ScopedModelDescendant(
          builder: (context, child, MealsContorller meals) {
        if (pageIndex == 0) {
          return HomeScreen(meals);
        } else if (pageIndex == 1) {
          return ShoppingCart();
        } else if (pageIndex == 2) {
          return Search();
        } else if (pageIndex == 3) {
          return BookMark();
        } else {
          return Proflie();
        }
      }),
    );
  }
}
