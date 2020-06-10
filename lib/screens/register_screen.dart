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
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  final Function toggleView;
  RegisterScreen({this.toggleView});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

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
              TabTitle("Create Account", false, inverted: true),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: <Widget>[
                    CustomInput(
                      "Full name",
                      fullNameController,
                      inverted: true,
                    ),
                    SizedBox(height: 10.0),
                    CustomInput(
                      "Email",
                      emailController,
                      inverted: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.0),
                    CustomInput(
                      "Phone number",
                      phoneNumberController,
                      inverted: true,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 10.0),
                    CustomInput(
                      "Password",
                      passwordController,
                      inverted: true,
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 10.0),
                    CustomInput(
                      "Confirm Password",
                      confirmPasswordController,
                      inverted: true,
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                "Create Account",
                () async {
                  var json = jsonEncode(<String, dynamic>{
                    'fullName': fullNameController.text,
                    'email': emailController.text,
                    'phoneNumber': phoneNumberController.text,
                    'password': passwordController.text,
                    'confirmPassword': confirmPasswordController.text,
                  });
                  var result = await _registerUser(context, json);
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
                "Already have an account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  letterSpacing: 1.0,
                ),
              ),
              FlatButton(
                child: Text(
                  "Login",
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

  Future<String> _registerUser(BuildContext context, String json) async {
    print(json);
    var confirmed = UserService.register(json);
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
