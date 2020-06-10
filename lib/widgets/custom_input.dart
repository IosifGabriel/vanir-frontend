import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool inverted;
  final bool isPassword;

  CustomInput(this.label, this.controller, {this.keyboardType = TextInputType.text, this.inverted = false, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      cursorColor: inverted ? Colors.white : Colors.black,
      style: TextStyle(
        color: inverted ? Colors.white : Colors.black,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: inverted ? Colors.white : Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: inverted ? Colors.white : Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: inverted ? Colors.white : Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
