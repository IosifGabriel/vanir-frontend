import 'package:flutter/material.dart';
import 'package:vanir_app/models/user_model.dart';
import 'package:vanir_app/services/user_service.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/not_found.dart';

import '../loader.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
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
            backgroundImage: NetworkImage(user.avatar),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          user.fullName,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
