import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanir_app/models/user_model.dart';
import 'package:vanir_app/screens/authenticate_screen.dart';
import 'package:vanir_app/screens/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return AuthenticateScreen();
    } else {
      return HomeScreen();
    }
  }
}
