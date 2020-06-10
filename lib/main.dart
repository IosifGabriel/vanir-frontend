import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanir_app/models/user_model.dart';
import 'package:vanir_app/screens/splash_screen.dart';
import 'package:vanir_app/services/user_service.dart';

void main() => runApp(VanirApp());

class VanirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: UserService.user,
      child: MaterialApp(
        title: "Vanir - Mobile banking",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          primaryColor: Color(0xFF7C4DFF),
          accentColor: Color(0xFF00FFA0),
          secondaryHeaderColor: Color(0xFFB7BED1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
