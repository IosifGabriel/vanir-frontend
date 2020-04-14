import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vanir_app/models/card_model.dart';
import 'package:vanir_app/widgets/cards/card_widget.dart';

class CardsCarousel extends StatelessWidget {
  final List<CreditCard> cards = [
    CreditCard("1", "John Doe", "4644 8302 5766 8768", "02/25", "727"),
    CreditCard("2", "John Doe", "4501 2580 3613 2066", "01/24", "558"),
    CreditCard("3", "John Doe", "4054 5809 4555 4010", "10/21", "691")
  ];

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
      onPageChanged: (int pageNumber) {
        print(pageNumber);
      },
      viewportFraction: 0.8,
      enlargeCenterPage: true,
    );
  }
}