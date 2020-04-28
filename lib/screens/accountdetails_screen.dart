import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class YourAccountDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Divider(
            height: 300.0,
            indent: 72.0,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              FontAwesomeIcons.piggyBank,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Account number',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'GBUE XXXX XXXX XXXX XXXX',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 0.0,
            indent: 72.0,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              FontAwesomeIcons.moneyBill,
            ),
            title: Text(
              'Account currency',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            subtitle: Text('Romanian Leu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}