import 'package:FoodDeliveryApp/Widget/ItemCard.dart';
import 'package:FoodDeliveryApp/Widget/PartTitle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<int, List> data = {
    0: [
      'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6',
      'Fruites',
      200.5
    ],
    1: [
      'https://www.verywellfit.com/thmb/a4580FjTjbub9q4kI5m9X-Po-p0=/2002x1334/filters:no_upscale():max_bytes(150000):strip_icc()/Bananas-5c6a36a346e0fb0001f0e4a3.jpg',
      'Banana',
      500.0
    ],
    2: [
      'https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/10/healthyFruit-517472788-770x533-1-650x428.jpg',
      'Roman',
      200.0
    ],
    3: [
      'https://www.wcrf-uk.org/sites/default/files/Apple_A-Z%20Fruit1.jpg',
      'Apple',
      100.0
    ],
    4: [
      'https://californiaavocado.com/wp-content/uploads/2020/07/avocado-fruit-berry.jpg',
      'Avocado',
      600.0
    ]
  };

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
              height: 270,
              child: scrollItem(
                350,
                170.0,
              ),
            ),
            PartTitle("Trending"),
            Container(
              height: 220,
              child: scrollItem(
                170,
                120,
              ),
            ),
          ],
        ),
      ),
    );
  }

  scrollItem(double itemWidth, double imageHight) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ItemCard(
            imageHight: imageHight,
            itemWidth: itemWidth,
            price: data[index][2],
            title: data[index][1],
            url: data[index][0]);
      },
      scrollDirection: Axis.horizontal,
    );
  }
}