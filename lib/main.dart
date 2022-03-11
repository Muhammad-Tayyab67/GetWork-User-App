// ignore: unused_import
//import 'package:firebas, e_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getwork/Allscreens/mainscreen.dart';
import 'Allscreens/RegistrationScreen.dart';
import 'Allscreens/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 2, 15, 26),
      ),
      initialRoute: mainscreen.idScreen,
      routes: {
        RegisterationScreen.idScreen: (context) => RegisterationScreen(),
        // ignore: prefer_const_constructors
        Loginscreen.idScreen: (context) => Loginscreen(),
        mainscreen.idScreen: (context) => mainscreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
