import 'package:FoodDeliveryApp/Widget/ItemCard.dart';
import 'package:FoodDeliveryApp/Widget/Loading.dart';
import 'package:FoodDeliveryApp/Widget/PartTitle.dart';
import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  final MealsContorller meals;
  HomeScreen(this.meals);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.meals.getMeals();
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
    return ScopedModelDescendant(
      builder: (context, child, MealsContorller meals) {
        if (meals.isGetMealsLoading == true) {
          return Loading();
        } else if (meals.allMeals.isEmpty) {
          return Center(
            child: Text("therw is not meals now "),
          );
        } else {
          return ListView.builder(
            itemCount: meals.allMeals.length,
            itemBuilder: (context, index) {
              return ItemCard(
                  imageHight: imageHight,
                  itemWidth: itemWidth,
                  price: meals.allMeals[index].price,
                  title: meals.allMeals[index].name,
                  url: meals.allMeals[index].image,
                  pressed: meals.allMeals[index].fav);
            },
            scrollDirection: Axis.horizontal,
          );
        }
      },
    );
  }
}
