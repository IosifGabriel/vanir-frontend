import 'package:flutter/material.dart';
import 'package:vanir_app/widgets/cards/cards_carousel.dart';
import 'package:vanir_app/widgets/section_title.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/transactions/transactions_list.dart';

class CardsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            TabTitle("Your cards"),
            CardsCarousel(),
            SectionTitle("Last transactions", () => print("View all")),
            TransactionsList(),
          ],
        )
      ],
    );
  }
}