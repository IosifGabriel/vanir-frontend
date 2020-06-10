import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/models/card_model.dart';
import 'package:vanir_app/screens/add_card_screen.dart';
import 'package:vanir_app/services/cards_service.dart';
import 'package:vanir_app/widgets/cards/card_settings.dart';
import 'package:vanir_app/widgets/cards/cards_carousel.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/not_found.dart';
import 'package:vanir_app/widgets/section_title.dart';
import 'package:vanir_app/widgets/tab_title.dart';

class CardsTab extends StatefulWidget {
  @override
  _CardsTabState createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  String cardId;
  Future<List<CreditCard>> futureCards;

  @override
  void initState() {
    super.initState();
    cardId = "";
    futureCards = CardsService.getCards();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CreditCard>>(
      future: futureCards,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) return NotFoundView();
          return _view(context, snapshot.data);
        } else if (snapshot.hasError) {
          return ErrorView();
        }
        return Loader();
      },
    );
  }

  Widget _view(BuildContext context, List<CreditCard> cards) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            TabTitle("Your cards", false, icon: FontAwesomeIcons.plus, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewCard()),
              );
            }),
            CardsCarousel(
              cards,
              (id) => setState(() => cardId = id),
            ),
            SectionTitle("Card settings", () => print("View all")),
            CardSettings(cardId),
          ],
        )
      ],
    );
  }
}
