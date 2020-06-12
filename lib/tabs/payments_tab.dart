import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/custom_button.dart';
import 'package:vanir_app/widgets/generateqrcodewidget.dart';

class PaymentsTab extends StatefulWidget {
  @override
  PaymentsTabState createState() => PaymentsTabState();
}

class PaymentsTabState extends State<PaymentsTab> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "  ";
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        children: <Widget>[
          Column(children: <Widget>[
            TabTitle("Scan your receipt", false),
            CustomButton("Start scanning", _read),
            TabTitle("QR CODE", false),
            GenerateQRWidget(),
            CustomButton("Scan qr code", scan2)
          ])
        ]);
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _cameraOcr,
        waitTap: true,
      );

      setState(() {
        _textValue = texts[0].value;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }

  Future scan2() async {
    try {
      var scanResult = await BarcodeScanner.scan();
      String barcode = scanResult.rawContent.toString();
      showDialog(
        context: context,
        child: CustomDialog.fromWidget(_payDialog(barcode)),
      );
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  Widget _payDialog(String barcode) {
    return Column(
      children: <Widget>[
        Text(
          "Pay",
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 10.0),
        Text(
          barcode,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 20.0),
        CustomButton(
          "\t\tPay\t\t",
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
