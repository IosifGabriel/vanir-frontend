import 'package:flutter/material.dart';
import 'package:vanir_app/models/card_model.dart';
import 'package:vanir_app/widgets/cards/card_widget.dart';
import 'package:vanir_app/widgets/custom_button.dart';
import 'package:vanir_app/widgets/tab_title.dart';

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: <Widget>[
            TabTitle("Add new card", true),
            Spacer(),
            RotatedBox(
              quarterTurns: 3,
              child: Container(
                height: 240.0,
                width: 340.0,
                child: CardWidget(CreditCard(
                    "", "John Doe", "XXXX XXXX XXXX XXXX", "XX/XX", "XXX")),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id mi maximus enim semper semper.",
                textAlign: TextAlign.center,
              ),
            ),
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
