import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:vanir_app/screens/generateqrcode.dart';
import 'package:vanir_app/screens/scanqrcode.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/custom_button.dart';



class PaymentsTab extends StatefulWidget{
  @override
  PaymentsTabState createState() => PaymentsTabState(); 
}



class PaymentsTabState extends State<PaymentsTab> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "  ";

  @override
  Widget build(BuildContext context) 
  {
    return ListView(
      padding:EdgeInsets.symmetric(vertical:50.0),
      children:<Widget>[
        Column(children: <Widget>[
          TabTitle("OCR Reading", false),
          CustomButton("Start scanning", _read),
          TabTitle("QR CODE", false),
            MyListTile("QR GENERATE", FontAwesomeIcons.qrcode, (){
                  Navigator.push(
                      context,
                    MaterialPageRoute(builder: (context) => GenerateScreen()));
            }),
              MyListTile("QR SCAN", FontAwesomeIcons.qrcode, (){
                  Navigator.push(
                      context,
                    MaterialPageRoute(builder: (context) => ScanScreen()));
            })
        ]
       )
      ]
    );
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

}


class MyListTile extends StatefulWidget {
  final String name;
  final IconData icon;
  final Function onTap;

  MyListTile(this.name, this.icon, [this.onTap]);

  @override
  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: ListTile(
          title: Text(
            widget.name,
            style: TextStyle(fontSize: 16.0, letterSpacing: 0.6),
          ),
          leading: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor
                ],
              ),
            ),
            child: Center(
              child: FaIcon(
                widget.icon,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

