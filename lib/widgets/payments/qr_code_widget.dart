import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vanir_app/app_context.dart';
import 'package:vanir_app/widgets/loader.dart';

class QRCodeWidget extends StatefulWidget {
  @override
  _QRCodeWidgetState createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  String loggedUserId;

  @override
  void initState() {
    super.initState();
    loggedUserId = null;
    AppContext.loggedUserId().then((value) {
      setState(() {
        loggedUserId = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return loggedUserId != null
        ? Center(
          child: QrImage(
            data: loggedUserId,
            size: 250,
          ),
        )
        : Loader();
  }
}
