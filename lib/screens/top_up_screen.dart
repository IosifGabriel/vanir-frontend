import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter(RegExp(r"[\d.]")),
                    ],
                    decoration: InputDecoration(
                      labelText: "Enter amount",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id mi maximus enim semper semper.",
                    textAlign: TextAlign.center,
                  ),
                ],
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
