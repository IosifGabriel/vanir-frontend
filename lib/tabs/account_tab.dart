import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vanir_app/screens/accountdetails_screen.dart';
import 'package:vanir_app/screens/wrapper.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/section_title.dart';
import 'package:vanir_app/widgets/tab_title.dart';
import '../widgets/cards/card_settings.dart';
import '../screens/personaldetails_screen.dart';

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            TabTitle("Profile", false),
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
            MyListTile("Personal information", FontAwesomeIcons.idCard, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => YourProfileScreen()));
            }),
            MyListTile("Account information", FontAwesomeIcons.piggyBank, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YourAccountDetailsScreen()));
            }),
            SizedBox(height: 20.0),
            SectionTitle("Security", () => print("View all")),
            MyListTile("Change password", FontAwesomeIcons.lock),
            MyListTile("Delete account", FontAwesomeIcons.mobile),
            SettingTile(
                "Use biometric data", FontAwesomeIcons.fingerprint, true),
            SettingTile(
              "Log out",
              FontAwesomeIcons.signOutAlt,
              true,
              () {
                showDialog(
                  context: context,
                  child: CustomDialog(
                    "Log out",
                    "Are you sure you want to log out?",
                    "Log out",
                    () async {
                      Navigator.pop(context);
                      var prefs = await SharedPreferences.getInstance();
                      prefs.remove('loggedUserId');
                      Wrapper.of(context).updateUser(null);
                    },
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

class MyListTile extends StatefulWidget {
  final String name;
  final IconData icon;
  final Function onTap;

  MyListTile(this.name, this.icon, [this.onTap]);

  @override
  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: ListTile(
          title: Text(
            widget.name,
            style: TextStyle(fontSize: 16.0, letterSpacing: 0.6),
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
              child: FaIcon(
                widget.icon,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
