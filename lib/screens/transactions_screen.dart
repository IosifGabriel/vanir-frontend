import 'package:flutter/material.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/widgets/transactions/transactions_list.dart';

class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              TabTitle("Transactions", true),
              TransactionsList(),
            ],
          ),
        ],
      ),
    );
  }
}
