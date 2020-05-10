import 'package:flutter/material.dart';
import 'package:vanir_app/widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  String title;
  String subtitle;
  String buttonText;
  Function onConfirmation;
  Widget widget;

  CustomDialog(this.title, this.subtitle, this.buttonText, this.onConfirmation);
  CustomDialog.fromWidget(this.widget);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget == null
              ? <Widget>[
                  Text(title, style: TextStyle(fontSize: 20.0)),
                  SizedBox(height: 10.0),
                  Text(subtitle, style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 20.0),
                  CustomButton(buttonText, onConfirmation),
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () => Navigator.pop(context),
                  )
                ]
              : <Widget>[widget],
        ),
      ),
    );
  }
}
