import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vanir_app/services/user_service.dart';
import 'package:vanir_app/widgets/custom_button.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/success.dart';
import 'package:vanir_app/widgets/tab_title.dart';

class TopUpScreen extends StatefulWidget {
  final Function callback;

  TopUpScreen({this.callback});

  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  TextEditingController amountController = new TextEditingController();

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
                    controller: amountController,
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
                ],
              ),
            ),
            Spacer(),
            CustomButton("Confirm", () async {
              var result =
                  await _topup(context, double.parse(amountController.text));
              if (result) {
                widget.callback();
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

  Future<bool> _topup(BuildContext context, double amount) async {
    var confirmed = UserService.topup(amount);
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
