import 'package:shared_preferences/shared_preferences.dart';

class AppContext {
  static Future<String> loggedUserId() async {
    var prefs = await SharedPreferences.getInstance();
    var loggedUserId = prefs.getString("loggedUserId") ?? "";
    return loggedUserId;
  }
}
