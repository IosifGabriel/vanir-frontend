import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(strokeWidth: 2.0),
          SizedBox(height: 20.0),
          Text(
            "Loading",
            style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }
}
