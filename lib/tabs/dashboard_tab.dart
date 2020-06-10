import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/screens/top_up_screen.dart';
import 'package:vanir_app/screens/transactions_screen.dart';
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
