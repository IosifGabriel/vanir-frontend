import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class YourProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 32.0,
              bottom: 16.0,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
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
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.camera_alt),
                      onPressed: () {}),
                )
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              FontAwesomeIcons.idCard,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name and birth date',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  'John Doe  - 01/01/1981',
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
              FontAwesomeIcons.houseUser,
            ),
            title: Text(
              'Adress',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            subtitle: Text('10 Downing Street, London, United Kingdom',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),),
            trailing: Icon(Icons.mode_edit),
            onTap: () {},
          ),
          Divider(
            height: 0.0,
            indent: 72.0,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              FontAwesomeIcons.phone,
            ),
            title: Text(
              'Phone',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            subtitle: Text(
              '+62 123-1234-1234',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            trailing: Icon(Icons.mode_edit),
            onTap: () {},
          ),
            Divider(
            height: 0.0,
            indent: 72.0,
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Icon(
              FontAwesomeIcons.mailBulk,
            ),
            title: Text(
              'Email',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            subtitle: Text(
              'johndoe@mymail.com',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            trailing: Icon(Icons.mode_edit),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}