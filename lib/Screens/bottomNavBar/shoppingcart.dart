import 'package:FoodDeliveryApp/Widget/ItemCard.dart';
import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:FoodDeliveryApp/model/MealsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();

  List<MealsModel> meals = [];
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.meals =
        Provider.of<MealsContorller>(context, listen: false).cartItems;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.meals.length);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Builder(
        builder: (BuildContext) {
          if (Provider.of<MealsContorller>(context).allMeals.isEmpty) {
            return Center(
              child: Text("no meals here"),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Provider.of<MealsContorller>(context).allMeals.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ItemCard(
                        imageHight: MediaQuery.of(context).size.height / 3.5,
                        itemWidth: MediaQuery.of(context).size.width,
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
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
