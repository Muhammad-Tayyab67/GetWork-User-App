//  pre_const_constructors, camel_case_types, prefer_final_fields, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mainscreen extends StatefulWidget {
  static const String idScreen = "mian";
  mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  Completer<GoogleMapController> _controllerGooglrMap = Completer();
  late GoogleMapController newgoogleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetWork"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController Controller) {
              _controllerGooglrMap.complete(Controller);
              newgoogleMapController = Controller;
            },
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 245.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 16.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]),
                // ignore: prefer_const_literals_to_create_immutables
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 18.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(children: [
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Hi there ..",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontFamily: "Brand-Bold"),
                    ),
                    Text(
                      "Where are You !",
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    )
                  ]),
                ),
              ))
        ],
      ),
    );
  }
}
