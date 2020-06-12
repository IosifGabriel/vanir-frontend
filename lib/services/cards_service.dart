import 'package:http/http.dart' as http;
import 'package:vanir_app/app_context.dart';
import 'package:vanir_app/config.dart';
import 'package:vanir_app/models/card_model.dart';
import 'dart:convert';

class CardsService {
  static String _resource = 'cards';
  static String _url = Config.apiBaseUrl + '/' + _resource;

  static Future<List<CreditCard>> getCards() async {
    var result = new List<CreditCard>();
    var id = await AppContext.loggedUserId();
    await http.get('$_url/',headers: {
      "id": id
    }).then((response) {
      if (response.statusCode == 200)
        result = (json.decode(response.body) as List)
            .map((model) => CreditCard.fromJson(model))
            .toList();
    }).catchError((e) {
      print('Get cards error: $e');
    });
    return result;
  }

  static Future<bool> addCard() async {
    var result = false;
    var id = await AppContext.loggedUserId();
    await http.post('$_url/', headers: {
      "id": id
    }).then((response) {
      if (response.statusCode == 200) result = true;
    }).catchError((e) {
      print('Add card error: $e');
    });
    return result;
  }

  static Future<bool> deleteCard(int cardId) async {
    var result = false;
    var id = await AppContext.loggedUserId();
    await http.delete(
      '$_url/$cardId',
      headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "id": id
      },
    ).then((response) {
      if (response.statusCode == 200) result = true;
    }).catchError((e) {
      print('Delete card error: $e');
    });
    return result;
  }
}
