import 'package:flutter/material.dart';
import 'package:vanir_app/models/balance_model.dart';
import 'package:vanir_app/services/user_service.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/not_found.dart';

class BalanceWidget extends StatefulWidget {
  @override
  _BalanceWidgetState createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  Future<Balance> futureBalance;

  @override
  void initState() {
    super.initState();
    futureBalance = UserService.getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Balance>(
      future: futureBalance,
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

  Widget _view(Balance balance) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 140.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 4.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('${balance.balance.toStringAsFixed(2)} ${balance.currency}', style: _balanceTextStyle),
              Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${balance.usdRate} USD', style: _currencyTextStyle),
                  Text('${balance.eurRate} EUR', style: _currencyTextStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final TextStyle _balanceTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
    wordSpacing: 4.0,
  );

  final TextStyle _currencyTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
  );
}
