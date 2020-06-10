import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vanir_app/screens/authenticate_screen.dart';
import 'package:vanir_app/screens/home_screen.dart';

class Wrapper extends StatefulWidget {
  static of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<_WrapperState>()
      : context.findAncestorStateOfType<_WrapperState>();

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String _userId;

  @override
  void initState() {
    super.initState();
    _userId = null;
    SharedPreferences.getInstance().then((prefs) {
      updateUser(prefs.getString("loggedUserId"));
    });
  }

  void updateUser(String userId) {
    setState(() {
      _userId = userId;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userId == null)
      return AuthenticateScreen();
    else
      return HomeScreen();
  }
}
