import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool inversed;

  CustomButton(this.text, this.onPressed, [this.inversed = false]);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: inversed
              ? LinearGradient(colors: [Colors.white, Colors.white])
              : LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Color(0xFF7C4DFF),
                    Color(0xFF00FFA0),
                  ],
                ),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 2.0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Text(
          text,
          style: TextStyle(
            color: inversed ? Theme.of(context).primaryColor : Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
