import 'package:FoodDeliveryApp/Screens/Result.dart';
import 'package:flutter/material.dart';

class PartTitle extends StatelessWidget {
  final String partTitle;
  final String partSunTitle;

  PartTitle(this.partTitle, {this.partSunTitle = 'View More'});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        partTitle,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      trailing: Text(
        partSunTitle,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ResultScreen(
                pageName: partTitle,
              );
            },
          ),
        );
      },
    );
  }
}
