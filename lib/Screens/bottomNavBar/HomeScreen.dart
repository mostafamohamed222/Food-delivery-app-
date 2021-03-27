import 'package:FoodDeliveryApp/Widget/ItemCard.dart';
import 'package:FoodDeliveryApp/Widget/Loading.dart';
import 'package:FoodDeliveryApp/Widget/PartTitle.dart';
import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FoodDeliveryApp/Screens/MealScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // final meals = Provider.of<MealsContorller>(context, listen: false);
    // meals.getMeals();
    super.initState();
  }

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Discover",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            PartTitle("Featuread Iteam"),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: scrollItem(
                350,
                170.0,
              ),
            ),
            PartTitle("Trending"),
            Container(
              height: MediaQuery.of(context).size.height / 2.9,
              child: scrollItem(
                MediaQuery.of(context).size.height / 3,
                140,
              ),
            ),
            PartTitle("hot offer"),
            Container(
              height: MediaQuery.of(context).size.height / 2.9,
              child: scrollItem(
                MediaQuery.of(context).size.height / 3,
                140,
              ),
            ),
          ],
        ),
      ),
    );
  }

  scrollItem(double itemWidth, double imageHight) {
    return Builder(
      builder: (BuildContext) {
        if (Provider.of<MealsContorller>(context).isGetMealsLoading) {
          return Loading();
        } else if (Provider.of<MealsContorller>(context).allMeals.isEmpty) {
          return Center(
            child: Text("no meals here"),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Provider.of<MealsContorller>(context).allMeals.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MealsScreen(Provider.of<MealsContorller>(context)
                        .allMeals[index]
                        .id);
                  }));
                },
                child: ItemCard(
                    imageHight: imageHight,
                    itemWidth: itemWidth,
                    price: Provider.of<MealsContorller>(context)
                        .allMeals[index]
                        .price,
                    title: Provider.of<MealsContorller>(context)
                        .allMeals[index]
                        .name,
                    url: Provider.of<MealsContorller>(context)
                        .allMeals[index]
                        .image,
                    pressed: Provider.of<MealsContorller>(context)
                        .allMeals[index]
                        .fav),
              );
            },
          );
        }
      },
    );
  }
}
