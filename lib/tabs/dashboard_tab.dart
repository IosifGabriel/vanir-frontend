import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/screens/top_up_screen.dart';
import 'package:vanir_app/screens/transactions_screen.dart';
import 'package:vanir_app/widgets/account/avatar.dart';
import 'package:vanir_app/widgets/dashboard/balance.dart';
import 'package:vanir_app/widgets/section_title.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/transactions/transactions_list.dart';

class DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Avatar(),
            SizedBox(height: 20.0),
            TabTitle("My balance", false, icon: FontAwesomeIcons.plus, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopUpScreen()),
              );
            }),
            BalanceWidget(),
            SectionTitle("Transactions", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransactionsScreen()),
              );
            }),
            TransactionsList(5)
          ],
        )
      ],
    );
  }
}
