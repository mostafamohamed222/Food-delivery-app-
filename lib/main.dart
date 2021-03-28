import 'package:FoodDeliveryApp/Screens/bottomNavBar/bottomnavbar.dart';
import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/signUp.dart';
import 'Screens/signIn.dart';
import 'Screens/bottomNavBar/bottomnavbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MealsContorller(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: BottomNavBar.id,
        routes: {
          '/': (context) => SignUp(),
          "/signIn": (context) => SiginScreen(),
          BottomNavBar.id: (context) => BottomNavBar(),
        },
      ),
    );
  }
}
