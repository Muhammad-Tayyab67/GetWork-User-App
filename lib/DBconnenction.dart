import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwork/Config.dart';

import 'AllWidgets/progressDialog.dart';
import 'Allscreens/RegistrationScreen.dart';
import 'Allscreens/mainscreen.dart';

class DBconnecntion {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signin(String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Loging in.. Please Wait . . . .",
          );
        });
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                logincheck(context),
              });
    } catch (er) {
      Fluttertoast.showToast(msg: er.toString());
      Navigator.pop(context);
      print(er);
    }
  }

  void signUp(String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Please Wait . . . .",
          );
        });

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) =>
            {RegisterationScreen().postDetailsToFirestore(context, _auth)})
        .catchError((e) {
      diplaymessage(e.toString(), context);
    });
  }

  void logincheck(context) {
    firebaseuser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseuser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => mainscreen()));
      } else {
        Fluttertoast.showToast(msg: "Login Failed");
        Navigator.pop(context);
      }
    });
  }
}
