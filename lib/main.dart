import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(VanirApp());

class VanirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vanir - Mobile banking",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: Color(0xFF7C4DFF),
        accentColor: Color(0xFF00FFA0),
        secondaryHeaderColor: Color(0xFFC7CCDB),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
}