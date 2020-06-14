import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vanir_app/services/transactions_service.dart';
import 'package:vanir_app/widgets/account/avatar.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/custom_input.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/payments/qr_code_widget.dart';
import 'package:vanir_app/widgets/success.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/custom_button.dart';

class PaymentsTab extends StatefulWidget {
  @override
  PaymentsTabState createState() => PaymentsTabState();
}

class PaymentsTabState extends State<PaymentsTab> {
  TextEditingController amountController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(children: <Widget>[
        TabTitle("Pay", false),
        Avatar(),
        SizedBox(height: 40.0),
        QRCodeWidget(),
        SizedBox(height: 40.0),
        Text("Make a payment"),
        SizedBox(height: 20.0),
        CustomButton("Scan a QR code and pay", _scanQRCode),
      ])
    ]);
  }

  Future _scanQRCode() async {
    try {
      var scanResult = await BarcodeScanner.scan();
      var scanContent = scanResult.rawContent;
      if (scanContent != "")
        showDialog(
          context: context,
          child: CustomDialog.fromWidget(_payDialog(scanContent)),
        );
    } catch (e) {
      print("Scan QR code error: $e");
    }
  }

  Widget _payDialog(String userId) {
    return Column(
      children: <Widget>[
        Text("Pay", style: TextStyle(fontSize: 20.0)),
        SizedBox(height: 20.0),
        Text(
          "Please enter the amount you want to send",
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.0),
        CustomInput(
          "Amount",
          amountController,
          inverted: false,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20.0),
        CustomButton(
          "Confirm payment",
          () async {
            var result = await _send(
                context, userId, double.parse(amountController.text));
            if (result) {
              Future.delayed(
                  Duration(
                    seconds: 2,
                    milliseconds: 250,
                  ),
                  () => Navigator.pop(context));
            }
          },
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Future<bool> _send(BuildContext context, String id, double amount) async {
    var confirmed = TransactionsService.send(id, amount);
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
