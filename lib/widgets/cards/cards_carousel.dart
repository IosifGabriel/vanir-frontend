import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vanir_app/models/card_model.dart';
import 'package:vanir_app/services/cards_service.dart';
import 'package:vanir_app/widgets/cards/card_settings.dart';
import 'package:vanir_app/widgets/cards/card_widget.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/not_found.dart';
import 'package:vanir_app/widgets/section_title.dart';

class CardsCarousel extends StatefulWidget {
  final Function callback;
  final Function(int) onPageChanged;

  CardsCarousel(this.onPageChanged, {this.callback});

  @override
  _CardsCarouselState createState() => _CardsCarouselState();
}

class _CardsCarouselState extends State<CardsCarousel> {
  int _cardId;
  Future<List<CreditCard>> futureCards;

  @override
  void initState() {
    super.initState();
    _cardId = 0;
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
    return Column(
      children: <Widget>[
        CarouselSlider(
          height: 220.0,
          items: cards.map((card) {
            return Builder(
              builder: (BuildContext context) {
                return CardWidget(card);
              },
            );
          }).toList(),
          enableInfiniteScroll: false,
          initialPage: 0,
          scrollDirection: Axis.horizontal,
          onPageChanged: (pageNum) {
            setState(() => _cardId = cards[pageNum].id);
          },
          viewportFraction: 0.8,
          enlargeCenterPage: true,
        ),
        SectionTitle("Card settings"),
        CardSettings(_cardId, callback: widget.callback),
      ],
    );
  }
}
