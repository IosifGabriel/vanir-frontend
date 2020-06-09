import 'package:flutter/material.dart';
import 'package:vanir_app/screens/login_screen.dart';
import 'package:vanir_app/screens/register_screen.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool showLogin = true;

  void toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(toggleView: toggleView);
    } else {
      return RegisterScreen(toggleView: toggleView);
    }
  }
}
