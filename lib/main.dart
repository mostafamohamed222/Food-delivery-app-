import 'package:FoodDeliveryApp/Screens/bottomNavBar/bottomnavbar.dart';
import 'package:flutter/material.dart';

import 'Screens/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SiginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
