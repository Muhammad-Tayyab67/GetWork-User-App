// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Datahandler/appdata.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController currentlocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String myadres = Provider.of<AppData>(context).pickuplocation != null
        ? Provider.of<AppData>(context).pickuplocation.placeName
        : "";
    currentlocation.text = myadres;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 255.0,
            // ignore: prefer_const_literals_to_create_immutables
            decoration: BoxDecoration(color: Color.fromARGB(255, 240, 237, 237),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                      offset: Offset(7.0, 7.0))
                ]),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25.0, bottom: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Stack(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.arrow_back),
                      Center(
                        child: Text(
                          "Set Drop Off",
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: "Brand-Bold"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 7.5,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.my_location),
                      SizedBox(
                        height: 7.5,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextField(
                            controller: currentlocation,
                            decoration: InputDecoration(
                                hintText: "Search Location",
                                fillColor: Color.fromARGB(255, 204, 204, 204),
                                isDense: true,
                                filled: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0, bottom: 8.0, top: 8.0)),
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
