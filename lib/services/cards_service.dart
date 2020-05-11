import 'package:http/http.dart' as http;
import 'package:vanir_app/config.dart';
import 'package:vanir_app/models/card_model.dart';
import 'dart:convert';

class CardsService {
  static String _resource = 'cards';
  static String _url = Config.apiBaseUrl + '/' + _resource;

  static Future<List<CreditCard>> getCards() async {
    var result = new List<CreditCard>();
    await http.get('$_url/').then((response) {
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
    await http.post('$_url/').then((response) {
      if (response.statusCode == 200) result = true;
    }).catchError((e) {
      print('Topup error: $e');
    });
    return result;
  }
}
