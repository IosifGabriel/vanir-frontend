import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:vanir_app/widgets/account/avatar.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/payments/qr_code_widget.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/custom_button.dart';

class PaymentsTab extends StatefulWidget {
  @override
  PaymentsTabState createState() => PaymentsTabState();
}

class PaymentsTabState extends State<PaymentsTab> {
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
        SizedBox(height: 10.0),
        Text(userId, style: TextStyle(fontSize: 16.0)),
        SizedBox(height: 20.0),
        CustomButton(
          "Confirm payment",
          () {
            print("TODO pay");
          },
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
