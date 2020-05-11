import 'package:flutter/material.dart';
import 'package:vanir_app/models/card_model.dart';
import 'package:vanir_app/services/cards_service.dart';
import 'package:vanir_app/widgets/cards/card_widget.dart';
import 'package:vanir_app/widgets/custom_button.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/success.dart';
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
                child: CardWidget(
                  CreditCard(
                    id: "",
                    cardholderName: "John Doe",
                    number: "XXXX XXXX XXXX XXXX",
                    expirationDate: "XX/XX",
                    cvv: "XXX",
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton("Confirm", () async {
              var result = await _addNewCard(context);
              if (result) {
                Future.delayed(
                    Duration(
                      seconds: 2,
                      milliseconds: 250,
                    ),
                    () => Navigator.pop(context));
              }
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

  Future<bool> _addNewCard(BuildContext context) async {
    var confirmed = CardsService.addCard();
    showDialog(
      context: context,
      child: CustomDialog.fromWidget(FutureBuilder<bool>(
        future: confirmed,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Future.delayed(Duration(seconds: 2), () => Navigator.pop(context));
            if (snapshot.data == false) return ErrorView();
            return SuccessView();
          } else if (snapshot.hasError) {
            return ErrorView();
          }
          return Loader();
        },
      )),
    );
    return confirmed;
  }
}
