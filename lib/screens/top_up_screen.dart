import 'package:flutter/material.dart';
import 'package:vanir_app/widgets/custom_button.dart';
import 'package:vanir_app/widgets/tab_title.dart';

class TopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: <Widget>[
            TabTitle("Top up", true),
            Spacer(),
            Spacer(),
            CustomButton("Confirm", () {
              print("New card added");
              Navigator.pop(context);
            }),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
