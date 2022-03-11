// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new, prefer_const_constructors_in_immutables, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwork/Allscreens/loginscreen.dart';
import 'package:getwork/main.dart';

import '../AllWidgets/progressDialog.dart';

// ignore: must_be_immutable
class RegisterationScreen extends StatelessWidget {
  static const String idScreen = "register";
  TextEditingController fnameTextEditingController = TextEditingController();
  TextEditingController lnameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController cnicTextEditingController = TextEditingController();
  TextEditingController passTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();

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
            Text("Register Here",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Bold"),
                textAlign: TextAlign.center),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: (Column(children: [
                  TextField(
                    controller: fnameTextEditingController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.grey)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  TextField(
                    controller: lnameTextEditingController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.grey)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  TextField(
                    controller: cnicTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "CNIC No",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.grey)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  TextField(
                    controller: cityTextEditingController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        labelText: "City",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.grey)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: mobileTextEditingController,
                    decoration: InputDecoration(
                        labelText: "Mobile No",
                        labelStyle: TextStyle(fontSize: 14.0),
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.grey)),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  TextField(
                    controller: emailTextEditingController,
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
                    controller: passTextEditingController,
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
                      if (fnameTextEditingController.text.length < 3) {
                        diplaymessage(
                            "Name should conatain more then 3 alphabets",
                            context);
                      } else if (lnameTextEditingController.text.length < 3) {
                        diplaymessage(
                            "Name should conatain more then 3 alphabets",
                            context);
                      } else if (cityTextEditingController.text.length < 3) {
                        diplaymessage(
                            "Address Must conatain more then 3 Words", context);
                      } else if (passTextEditingController.text.length < 3) {
                        diplaymessage(
                            "Password should conatain more then 3 alphabets",
                            context);
                      } else if (mobileTextEditingController.text.length < 3) {
                        diplaymessage(
                            "Mobile Must conatain more then 11 Digits",
                            context);
                      } else if (cnicTextEditingController.text.length < 3) {
                        diplaymessage(
                            "CINIC should conatain more then 13 Digits",
                            context);
                      } else if (!emailTextEditingController.text
                          .contains("@")) {
                        diplaymessage(
                            "Email should conatain more then @gmail.. alphabets",
                            context);
                      } else {
                        RegisterUser(context);
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return ProgressDialog(
                                message: "Please Wait . . . .",
                              );
                            });
                        Navigator.pushNamedAndRemoveUntil(
                            context, Loginscreen.idScreen, (route) => false);
                      }
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45.0,
                        width: 150.0,
                        child: Text(
                          "Register Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: "Brand-Bold"),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Loginscreen.idScreen, (route) => false);
                      },
                      child: Text(
                        "Already have an Acount , Login Here",
                        style:
                            TextStyle(fontSize: 12.0, fontFamily: "Brand-Bold"),
                      ))
                ]))),
          ]),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void RegisterUser(BuildContext context) async {
    final User? fireBaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passTextEditingController.text)
            .catchError((onError) {
      Navigator.pop(context);
      diplaymessage(onError.toString(), context);
    }))
        .user;
    if (fireBaseUser != null) {
      Map userDataMap = {
        "First_Name": fnameTextEditingController.text.trim(),
        "Last_Name": lnameTextEditingController.text.trim(),
        "CNIC": cnicTextEditingController.text.trim(),
        "Mobile": mobileTextEditingController.text.trim(),
        "Address": cityTextEditingController.text.trim()
      };
      userRef.child(fireBaseUser.uid).set(userDataMap);

      diplaymessage("Congatulation your Registeration is Done", context);
    } else {
      diplaymessage("Fialed To Create your Acount", context);
    }
  }
}

diplaymessage(String msg, BuildContext context) {
  Fluttertoast.showToast(msg: msg);
}
