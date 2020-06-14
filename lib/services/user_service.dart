import 'package:http/http.dart' as http;
import 'package:vanir_app/app_context.dart';
import 'package:vanir_app/config.dart';
import 'package:vanir_app/models/balance_model.dart';
import 'dart:convert';
import 'package:vanir_app/models/user_model.dart';

class UserService {
  static String _resource = 'users';
  static String _url = Config.apiBaseUrl + '/' + _resource;

  static Stream<User> get user {
    return Stream.fromFuture(getUser());
  }

  static Future<User> getUser() async {
    var result = new User();
    var id = await AppContext.loggedUserId();
    await http.get('$_url/$id').then((response) {
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
    var id = await AppContext.loggedUserId();
    await http.get('$_url/balance', headers: {
      "id": id
    }).then((response) {
      if (response.statusCode == 200)
        result = Balance.fromJson(json.decode(response.body));
    }).catchError((e) {
      print('Get balance error: $e');
    });
    return result;
  }

  static Future<bool> topup(double amount) async {
    var result = false;
    var id = await AppContext.loggedUserId();
    await http
        .post('$_url/balance',
            headers: {
              "accept": "application/json",
              "content-type": "application/json",
              "id": id
            },
            body: amount.toString())
        .then((response) {
      if (response.statusCode == 200) result = true;
    }).catchError((e) {
      print('Topup error: $e');
    });
    return result;
  }


static Future<bool> send(String idReceiver, double amount) async {
  var result = false;
  var id = await AppContext.loggedUserId();
  await http.
      post('$_url/transactions',
              headers:{
                "accept":"application/json",
                "content-type":"application/json",
                "id": id
              },
              body: jsonEncode(<String, dynamic>{
              'recipientId': idReceiver,
              'amount': amount,
            }))
              .then((response) {
      if (response.statusCode == 200) result = true;
    }).catchError((e) {
      print('Send error: $e');
    });
    return result;
  }
}


