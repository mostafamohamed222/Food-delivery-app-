import 'package:FoodDeliveryApp/Widget/ProfileItem.dart';
import 'package:flutter/material.dart';

class Proflie extends StatefulWidget {
  @override
  _ProflieState createState() => _ProflieState();
}

class _ProflieState extends State<Proflie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Mostafa Mohamed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          ProflieItem(
            text: "mousamostafa00@gamil.com",
            icon: Icons.email,
          ),
          ProflieItem(
            text: "*****",
            icon: Icons.lock,
          ),
          ProflieItem(
            text: "19/07/1997",
            icon: Icons.date_range,
          ),
          ProflieItem(
            text: "19/07/1997",
            icon: Icons.language,
          ),
          ProflieItem(
            text: "logout",
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
