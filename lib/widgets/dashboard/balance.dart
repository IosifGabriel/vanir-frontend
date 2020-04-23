import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 140.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 4.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("1,675.31 RON", style: _balanceTextStyle),
              Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("1 RON", style: _currencyTextStyle),
                  Text("4.1 USD", style: _currencyTextStyle),
                  Text("4.8 EUR", style: _currencyTextStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final TextStyle _balanceTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
    wordSpacing: 4.0,
  );

  final TextStyle _currencyTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
  );
}
