import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final double itemWidth;
  final double imageHight;
  final String url;
  final String title;
  final double price;
  bool pressed;

  ItemCard(
      {@required this.imageHight,
      @required this.itemWidth,
      @required this.price,
      @required this.title,
      @required this.url,
      this.pressed});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.itemWidth,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: widget.imageHight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.url),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              widget.price.toString() + '\$',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            trailing: IconButton(
              icon: Icon(widget.pressed == false
                  ? Icons.favorite_border
                  : Icons.favorite),
              color: widget.pressed == false ? Colors.grey : Colors.red,
              onPressed: () {
                setState(() {
                  widget.pressed = !widget.pressed;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
