import 'package:flutter/material.dart';
import 'package:vanir_app/screens/transactions_screen.dart';
import 'package:vanir_app/widgets/chart/chart_widget.dart';
import 'package:vanir_app/widgets/section_title.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/transactions/transactions_list.dart';

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            TabTitle("Analytics", false),
            SizedBox(height: 10.0),
            AnalyticsChart(),
            SizedBox(height: 10.0),
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
