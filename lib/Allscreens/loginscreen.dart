// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_import, sized_box_for_whitespace

import 'package:flutter/material.dart'
    show
        Alignment,
        BorderRadius,
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FlatButton,
        Image,
        InputDecoration,
        Key,
        Navigator,
        Padding,
        RaisedButton,
        RoundedRectangleBorder,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        TextField,
        TextInputType,
        TextStyle,
        Widget,
        showDialog;
import 'package:getwork/AllWidgets/progressDialog.dart';
import 'package:getwork/Allscreens/RegistrationScreen.dart';
import 'package:getwork/Allscreens/mainscreen.dart';
import 'package:getwork/main.dart';

class Loginscreen extends StatelessWidget {
  static const String idScreen = "login";
  const Loginscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Image.asset(
              "images/sexylogo.jpeg",
              alignment: Alignment.center,
              height: 200,
            ),
            Text("Login here In",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Bold"),
                textAlign: TextAlign.center),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: (Column(children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.grey)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.grey)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return ProgressDialog(
                              message: "Please Wait . . . .",
                            );
                          });
                      Navigator.pushNamedAndRemoveUntil(
                          context, mainscreen.idScreen, (route) => false);
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45.0,
                        width: 150.0,
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: "Brand-Bold"),
                        ),
                      ),
                    ),
                    // ignore: unnecessary_new
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegisterationScreen.idScreen, (route) => false);
                      },
                      child: Text(
                        "Do not have acount , Register here",
                        style:
                            TextStyle(fontSize: 12.0, fontFamily: "Brand-Bold"),
                      ))
                ]))),
          ]),
        ),
      ),
    );
  }
}
