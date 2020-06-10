import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vanir_app/config.dart';
import 'package:vanir_app/models/balance_model.dart';
import 'dart:convert';
import 'package:vanir_app/models/user_model.dart';

class UserService {
  static String _resource = 'user';
  static String _url = Config.apiBaseUrl + '/' + _resource;

  static Stream<User> get user {
    return Stream.fromFuture(getUser());
  }

  static Future<User> getUser() async {
    var prefs = await SharedPreferences.getInstance();
    var loggedUserId = prefs.getString("loggedUserId") ?? "";

    var result = new User();
    await http.get('$_url/$loggedUserId').then((response) {
      if (response.statusCode == 200)
        result = User.fromJson(json.decode(response.body));
    }).catchError((e) {
      print('Get user error: $e');
    });
    return result;
  }

  static Future<String> login(String email, String password) async {
    String id = null;
    await http
        .post('$_url/login',
            headers: {
              "accept": "application/json",
              "content-type": "application/json"
            },
            body: jsonEncode(<String, dynamic>{
              'email': email,
              'password': password,
            }))
        .then((response) {
      if (response.statusCode == 200) {
        id = json.decode(response.body)["id"];
      }
    }).catchError((e) {
      print('Login error: $e');
    });
    return id;
  }

  static Future<String> register(String body) async {
    String id = null;
    await http
        .post('$_url/register',
            headers: {
              "accept": "application/json",
              "content-type": "application/json"
            },
            body: body)
        .then((response) {
      if (response.statusCode == 200) {
        id = json.decode(response.body)["id"];
      }
    }).catchError((e) {
      print('Register error: $e');
    });
    return id;
  }

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
