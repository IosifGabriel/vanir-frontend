import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vanir_app/models/user_model.dart';
import 'package:vanir_app/widgets/account/avatar.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/not_found.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import 'package:vanir_app/services/user_service.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TabTitle("Personal details", true),
          SizedBox(height: 20.0),
          Avatar(),
          PersonalDetails(),
        ],
      ),
    );
  }
}

class PersonalDetails extends StatefulWidget {
  PersonalDetails({Key key}) : super(key: key);

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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
          return _view(snapshot.data);
        } else if (snapshot.hasError) {
          return ErrorView();
        }
        return Loader();
      },
    );
  }

  Widget _view(User user) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        _infoTile(FontAwesomeIcons.idCard,'Name',user.fullName),
        Divider(height: 0.0,indent: 72.0,),
        _infoTile(FontAwesomeIcons.houseUser,'Address','10 Downing Street, London, United Kingdom'),
        Divider(height: 0.0, indent: 72.0),
        _infoTile(FontAwesomeIcons.phone,'Email',user.phoneNumber),
        Divider(height: 0.0, indent: 72.0),
        _infoTile(FontAwesomeIcons.mailBulk, "Email", user.email),
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
      trailing: Icon(Icons.mode_edit),
      onTap: () {},
    );
  }
}
