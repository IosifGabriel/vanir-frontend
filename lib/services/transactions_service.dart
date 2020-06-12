import 'package:http/http.dart' as http;
import 'package:vanir_app/app_context.dart';
import 'package:vanir_app/config.dart';
import 'dart:convert';
import 'package:vanir_app/models/transaction_model.dart';

class TransactionsService {
  static String _resource = 'transactions';
  static String _url = Config.apiBaseUrl + '/' + _resource;

  static Future<List<Transaction>> getTransactions() async {
    var id = await AppContext.loggedUserId();
    var result = new List<Transaction>();
    await http.get('$_url/', headers: {
      "id": id
    }).then((response) {
      if (response.statusCode == 200)
        result = (json.decode(response.body) as List)
            .map((model) => Transaction.fromJson(model))
            .toList();
    }).catchError((e) {
      print('Get transactions error: $e');
    });
    return result;
  }
}
