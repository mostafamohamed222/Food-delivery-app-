import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:FoodDeliveryApp/Screens/bottomNavBar/bottomnavbar.dart';
import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'Screens/signUp.dart';
import 'Screens/signIn.dart';
import 'Screens/bottomNavBar/bottomnavbar.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  // const String url =
  //     "https://fooddeliveryapptest-ef073-default-rtdb.firebaseio.com/meals.json";
  // http.post(
  //   url,
  //   body: json.encode(
  //     {
  //       "fav": false,
  //       "image":
  //           "https://www.wcrf-uk.org/sites/default/files/Apple_A-Z%20Fruit1.jpg",
  //       "price": 10.5,
  //       "title": "Apple",
  //     },
  //   ),
  // );

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
