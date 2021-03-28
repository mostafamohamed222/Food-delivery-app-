import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:FoodDeliveryApp/model/MealsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatefulWidget {
  final String id;
  MealsScreen(this.id);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MealsModel meal = Provider.of<MealsContorller>(context).getById(widget.id);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          meal.name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(meal.image),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Price :"),
                    tileColor: Colors.deepOrange,
                    trailing: Text(
                      meal.price.toString(),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Provider.of<MealsContorller>(context, listen: false)
                              .decrementQuantity();
                        },
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        ),
                      ),
                      Text(
                        Provider.of<MealsContorller>(context)
                            .quantity
                            .toString(),
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<MealsContorller>(context, listen: false)
                              .incrementQuantity();
                        },
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Provider.of<MealsContorller>(context, listen: false)
                            .addToCart(
                                meal.id,
                                Provider.of<MealsContorller>(context,
                                        listen: false)
                                    .quantity);
                      },
                      child: Text(
                        "add to cart",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
