import 'package:flutter/material.dart';

class ProflieItem extends StatefulWidget {
  final String text;
  final IconData icon;

  ProflieItem({this.text, this.icon});

  @override
  _ProflieItemState createState() => _ProflieItemState();
}

class _ProflieItemState extends State<ProflieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            widget.icon,
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Icon(
            Icons.edit,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
