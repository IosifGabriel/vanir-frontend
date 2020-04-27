import 'package:flutter/material.dart';
import 'package:vanir_app/models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CreditCard card;

  CardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CardTextWidget(card.cardholderName, "Cardholder Name"),
                Image(
                  image: AssetImage("assets/images/visa_logo.png"),
                  height: 18.0,
                ),
              ],
            ),
            CardTextWidget(card.number, "Card Number"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CardTextWidget(card.expirationDate, "Expiration Date"),
                CardTextWidget(card.cvv, "CVV"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardTextWidget extends StatelessWidget {
  final String text;
  final String caption;

  CardTextWidget(this.text, this.caption);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          caption,
          style: TextStyle(
              height: 1.0,
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.6),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            wordSpacing: 5.0,
          ),
        ),
      ],
    );
  }
}
