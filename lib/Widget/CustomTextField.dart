import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextInputType type;
  final GlobalKey<FormState> keyField;
  final TextEditingController controller;

  CustomField(
      {this.label, this.icon, this.type, this.keyField, this.controller});

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        key: widget.keyField,
        validator: (value) {
          if (value.isEmpty) {
            return "faield is empty";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black,
          ),
          labelText: widget.label,
        ),
        keyboardType: widget.type,
        textInputAction: TextInputAction.done,
        controller: widget.controller,
      ),
    );
  }
}
