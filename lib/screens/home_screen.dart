import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/tabs/dashboard_tab.dart';
import 'package:vanir_app/tabs/cards_tab.dart';
import 'package:vanir_app/tabs/placeholder_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  final List<Widget> _tabs = [
    DashboardTab(),
    PlaceholderTab("Analytics"),
    CardsTab(),
    PlaceholderTab("Payments"),
    PlaceholderTab("Account")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() => _currentTab = index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).secondaryHeaderColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wallet, size: 24.0),
            title: Text("Dashboard"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartPie, size: 24.0),
            title: Text("Analytics"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.creditCard, size: 24.0),
            title: Text("Cards"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.moneyBillWave, size: 24.0),
            title: Text("Payments"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAlt, size: 24.0),
            title: Text("Account"),
          ),
        ],
      ),
    );
  }
}
