import 'package:flutter/material.dart';
import 'package:vanir_app/widgets/custom_button.dart';
import 'package:vanir_app/widgets/custom_input.dart';
import 'package:vanir_app/widgets/tab_title.dart';

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
              CustomButton("Create Account", () {}, true),
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
}
