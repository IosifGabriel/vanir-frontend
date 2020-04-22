import 'package:flutter/material.dart';
import 'package:vanir_app/models/transaction_model.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction("1", "Abernathy-Waters", 8.18, "06-Apr-2020", "RON"),
    Transaction("2", "Collier Inc", 17.28, "28-Mar-2020", "RON"),
    Transaction("3", "Towne LLC", 19.24, "26-Mar-2020", "EUR"),
    Transaction("4", "TFunk Inc", 4.05, "18-Mar-2020", "USD")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, i) {
        var transaction = transactions[i];
        return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 2.0),
          child: ListTile(
            title: Text(
              transaction.recipient,
              style: TextStyle(fontSize: 16.0, letterSpacing: 0.6),
            ),
            subtitle: Text(
              transaction.date,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
            ),
            leading: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  transaction.recipient.toUpperCase().substring(0, 2),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            trailing: Text(
              "-${transaction.amount.toStringAsFixed(2)} ${transaction.currency}",
              style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
            ),
          ),
        );
      },
    );
  }
}
