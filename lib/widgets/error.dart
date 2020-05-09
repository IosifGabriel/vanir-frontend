import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "OOPS...",
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1.0,
            ),
          ),
          Text(
            "Something went wrong",
            style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }
}
