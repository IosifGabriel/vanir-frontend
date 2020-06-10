import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vanir_app/screens/wrapper.dart';
import 'package:vanir_app/services/user_service.dart';
import 'package:vanir_app/widgets/custom_button.dart';
import 'package:vanir_app/widgets/custom_dialog.dart';
import 'package:vanir_app/widgets/custom_input.dart';
import 'package:vanir_app/widgets/error.dart';
import 'package:vanir_app/widgets/loader.dart';
import 'package:vanir_app/widgets/success.dart';
import 'package:vanir_app/widgets/tab_title.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              TabTitle("Login", false, inverted: true),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: <Widget>[
                    CustomInput(
                      "Email",
                      emailController,
                      inverted: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.0),
                    CustomInput(
                      "Password",
                      passwordController,
                      inverted: true,
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                "\tLogin\t",
                () async {
                  var result = await _loginUser(
                      context, emailController.text, passwordController.text);
                  if (result != null) {
                    Navigator.pop(context);
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString("loggedUserId", result);
                    Wrapper.of(context).updateUser(result);
                  }
                },
                true,
              ),
              SizedBox(height: 20.0),
              Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  letterSpacing: 1.0,
                ),
              ),
              FlatButton(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => widget.toggleView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _loginUser(
      BuildContext context, String email, String password) async {
    var confirmed = UserService.login(email, password);
    showDialog(
      context: context,
      child: CustomDialog.fromWidget(FutureBuilder<String>(
        future: confirmed,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) return ErrorView();
            return SuccessView();
          } else if (snapshot.hasError) {
            return ErrorView();
          }
          return Loader();
        },
      )),
    );
    return confirmed;
  }
}
