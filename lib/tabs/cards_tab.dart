import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/screens/add_card_screen.dart';
import 'package:vanir_app/widgets/cards/cards_carousel.dart';
import 'package:vanir_app/widgets/tab_title.dart';

class CardsTab extends StatefulWidget {
  @override
  _CardsTabState createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  String _lastUpdated;
  int _cardId;

  @override
  void initState() {
    super.initState();
    _lastUpdated = DateTime.now().toString();
    _cardId = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Column(
          key: Key(_lastUpdated),
          children: <Widget>[
            TabTitle("Your cards", false, icon: FontAwesomeIcons.plus,
                onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewCard(
                    callback: () {
                      setState(() => _lastUpdated = DateTime.now().toString());
                    },
                  ),
                ),
              );
            }),
            CardsCarousel(
              (id) => setState(() => _cardId = id),
              callback: () =>
                  setState(() => _lastUpdated = DateTime.now().toString()),
            ),
          ],
        )
      ],
    );
  }
}
