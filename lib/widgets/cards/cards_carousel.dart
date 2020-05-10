import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vanir_app/models/card_model.dart';
import 'package:vanir_app/widgets/cards/card_widget.dart';

class CardsCarousel extends StatelessWidget {
  final List<CreditCard> cards;
  final Function(int) onPageChanged;

  CardsCarousel(this.cards, this.onPageChanged);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
      onPageChanged: onPageChanged,
      viewportFraction: 0.8,
      enlargeCenterPage: true,
    );
  }
}
