import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/models/user_model.dart';
import 'package:vanir_app/services/user_service.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/not_found.dart';
import 'package:vanir_app/widgets/tab_title.dart';


class UserAccountDetails extends StatelessWidget {
  const UserAccountDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TabTitle("Account details", true),
          SizedBox(height: 20.0),
          AccountDetails(),
        ],
      ),
    );
  }
}

class AccountDetails extends StatefulWidget {
  AccountDetails({Key key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = UserService.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) return NotFoundView();
          return _viewAccount(snapshot.data);
        } else if (snapshot.hasError) {
          return ErrorView();
        }
        return Loader();
      },
    );
  }




Widget _viewAccount(User user) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        _infoTile(FontAwesomeIcons.piggyBank,'Account Number','VNRO 1234 6785 8475 3464'),
        Divider(height: 0.0,indent: 72.0,),
        _infoTile(FontAwesomeIcons.dollarSign,'Currency','Romanian Leu'),
      ],
    );
  }


  Widget _infoTile(IconData icon, String property, String value) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      leading: Icon(icon),
      title: Text(
        property,
        style: TextStyle(color: Colors.grey, fontSize: 15.0),
      ),
      subtitle: Text(
        value,
        style: TextStyle(color: Colors.black, fontSize: 16.0),
      ),
      onTap: () {},
    );
  }
}