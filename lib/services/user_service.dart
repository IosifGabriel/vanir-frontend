import 'package:http/http.dart' as http;
import 'package:vanir_app/config.dart';
import 'package:vanir_app/models/balance_model.dart';
import 'dart:convert';

class UserService {
  static String _resource = 'user';
  static String _url = Config.apiBaseUrl + '/' + _resource;

  static Future<Balance> getBalance() async {
    var result = new Balance();
    await http.get('$_url/balance').then((response) {
      if (response.statusCode == 200)
        result = Balance.fromJson(json.decode(response.body));
    }).catchError((e) {
      print('Get balance error: $e');
    });
    return result;
  }

  static Future<bool> topup(double amount) async {
    var result = false;
    await http
        .post('$_url/balance',
            headers: {
              "accept": "application/json",
              "content-type": "application/json"
            },
            body: jsonEncode(<String, dynamic>{
              'amount': amount,
            }))
        .then((response) {
      if (response.statusCode == 200) result = true;
    }).catchError((e) {
      print('Topup error: $e');
    });
    return result;
  }
}
