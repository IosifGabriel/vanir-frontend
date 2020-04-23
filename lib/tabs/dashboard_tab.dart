import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/screens/top_up_screen.dart';
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
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=750&amp;q=80%20750w"),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "John Doe",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 20.0),
            TabTitle("My balance", false, FontAwesomeIcons.plus, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopUpScreen()),
              );
            }),
            Balance(),
            SectionTitle("Transactions", () => print("View all")),
            TransactionsList()
          ],
        )
      ],
    );
  }
}

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Text("1,675.31 RON", style: _balanceTextStyle),
              Divider(color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("1 RON", style: _currencyTextStyle),
                  Text("4.1 USD", style: _currencyTextStyle),
                  Text("4.8 EUR", style: _currencyTextStyle),
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
