import 'package:FoodDeliveryApp/Widget/ItemCard.dart';
import 'package:FoodDeliveryApp/model/MealsControllers.dart';
import 'package:FoodDeliveryApp/model/MealsModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Builder(
        builder: (buildContext) {
          if (Provider.of<MealsContorller>(context).cartItems.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Icon(
                    Icons.shopping_basket,
                    size: 250,
                    color: Colors.orange,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "your basket is empty",
                      style: TextStyle(color: Colors.pink, fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "go to home and add some meals to it",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:
                        Provider.of<MealsContorller>(context).cartItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          cartItem(
                              price: Provider.of<MealsContorller>(context)
                                  .cartItems[index]
                                  .price,
                              title: Provider.of<MealsContorller>(context)
                                  .cartItems[index]
                                  .name,
                              url: Provider.of<MealsContorller>(context)
                                  .cartItems[index]
                                  .image,
                              mealsNumber: Provider.of<MealsContorller>(context)
                                  .cartItems[index]
                                  .numberOfMeals),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTile(
                        title: Text("Delivery Cost"),
                        trailing: Text(
                          "20 \$",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text("Total price"),
                        trailing: Text(
                          Provider.of<MealsContorller>(context)
                                  .cartItemPrice()
                                  .toString() +
                              " \$",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * .6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange,
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text("Check out"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  cartItem({price, title, url, mealsNumber}) {
    return ListTile(
      leading: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(url),
          ),
        ),
      ),
      title: Text(
        title + " X $mealsNumber",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text("item price ${price.toString()} \$"),
    );
  }
}
