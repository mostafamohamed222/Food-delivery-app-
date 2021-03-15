import 'package:FoodDeliveryApp/Screens/bottomNavBar/bottomnavbar.dart';
import 'package:flutter/material.dart';

import 'Screens/signUp.dart';
import 'Screens/signIn.dart';
import 'Screens/bottomNavBar/bottomnavbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SignUp(),
        "/signIn": (context) => SiginScreen(),
        BottomNavBar.id: (context) => BottomNavBar(),
      },
    );
  }
}
