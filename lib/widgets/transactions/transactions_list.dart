import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vanir_app/models/transaction_model.dart';
import 'package:vanir_app/services/transactions_service.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/not_found.dart';

class TransactionsList extends StatefulWidget {
  final int top;

  TransactionsList([this.top]);

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  Future<List<Transaction>> futureTransactions;

  @override
  void initState() {
    super.initState();
    futureTransactions = TransactionsService.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: futureTransactions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) return NotFoundView();
          return _view(snapshot.data);
        } else if (snapshot.hasError) {
          return ErrorView();
        }
        return Loader();
      },
    );
  }

  Widget _view(List<Transaction> transactions) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: widget.top == null
          ? transactions.length
          : min(widget.top, transactions.length),
      itemBuilder: (context, i) {
        var transaction = transactions[i];
        return Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 2.0),
          child: ListTile(
            title: Text(
              transaction.recipient.toString(),
              style: TextStyle(fontSize: 16.0, letterSpacing: 0.6),
            ),
            subtitle: Text(
              transaction.date,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
            ),
            leading: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(transaction.recipientAvatar),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            trailing: Text(
              "${transaction.amount.toStringAsFixed(2)} ${transaction.currency}",
              style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
            ),
          ),
        );
      },
    );
  }
}
