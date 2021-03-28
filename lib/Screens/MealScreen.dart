import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:FoodDeliveryApp/model/MealsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatelessWidget {
  var id;
  MealsScreen(this.id);
  @override
  Widget build(BuildContext context) {
    MealsModel meal = Provider.of<MealsContorller>(context).getById(id);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .95,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(meal.image),
              ),
            ),
          ),
          ListTile(
            title: Text(
              meal.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              meal.price.toString() + ' \$',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.black,
              onPressed: () {
                Provider.of<MealsContorller>(context, listen: false)
                    .addToCart(meal.id);
              },
              child: Text(
                "add to cart",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
