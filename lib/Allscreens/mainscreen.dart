//  pre_const_constructors, camel_case_types, prefer_final_fields, non_constant_identifier_names, prefer_const_constructors_in_immutables

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, prefer_final_fields, unnecessary_new, sized_box_for_whitespace, prefer_const_constructors_in_immutables, non_constant_identifier_names, duplicate_ignore, unused_local_variable, unnecessary_null_comparison, import_of_legacy_library_into_null_safe, prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getwork/Allscreens/RegistrationScreen.dart';
import 'package:getwork/Allscreens/searchScreen.dart';
import 'package:getwork/Datahandler/appdata.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../Assitants/FetchingAddress.dart';

class mainscreen extends StatefulWidget {
  static const String idScreen = "mian";
  mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> with TickerProviderStateMixin {
  Completer<GoogleMapController> _controllerGooglrMap = Completer();
  late GoogleMapController newgoogleMapController;

  late Position currentPosition;

  var geolocator = Geolocator();

  double bottempadding = 0.0;
//Current location Function
  void locatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

// Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        diplaymessage("Location is not Enabled", context);
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLatposition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatposition, zoom: 14);
    newgoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String Address =
        await AssistantMethods.searchCoordinateAddress(position, context);
  }

//Initial Location
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  //Containers Width
  double searchconatainerHt = 245.0;
  double labourContainerHt = 0.0;
  double requestContainerHT = 0.0;
  void switchcontainer() {
    if (labourContainerHt == 285.0) {
      setState(() {
        requestContainerHT = 300.0;
      });
    } else {
      setState(() {
        searchconatainerHt = 0.0;
        labourContainerHt = 285.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("GetWork"),
      ),
      drawer: Container(
        color: Colors.white,
        width: 230.0,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 150.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Image.network(
                          "https://avatars.githubusercontent.com/u/95230366?v=4",
                          height: 77.0,
                          width: 90.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            "User Name",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Email ",
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 10.0),
              ListTile(
                title: Text("Acount"),
                subtitle: Text("edit acount"),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                title: Text("History"),
                leading: Icon(Icons.history),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.account_box_rounded),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            padding: EdgeInsets.only(bottom: bottempadding),
            mapType: MapType.normal,
            compassEnabled: true,
            mapToolbarEnabled: true,
            tiltGesturesEnabled: false,
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController Controller) {
              _controllerGooglrMap.complete(Controller);
              newgoogleMapController = Controller;
              locatePosition();
              setState(() {
                bottempadding = 300.0;
              });
            },
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: AnimatedSize(
                // ignore: deprecated_member_use
                vsync: this,
                curve: Curves.bounceIn,
                duration: Duration(milliseconds: 160),
                child: Container(
                  height: searchconatainerHt,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 228, 228),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              "Hii there ..",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontFamily: "Brand-Bold"),
                            ),
                            Divider(),
                            Text(
                              "Where are You !",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 206, 202, 202),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(137, 139, 134, 134),
                                        blurRadius: 6.0,
                                        spreadRadius: 0.5,
                                        offset: Offset(0.7, 0.7),
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Search Location ..",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontFamily: "Bold-brand"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                switchcontainer();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<AppData>(context)
                                                    .pickuplocation !=
                                                null
                                            ? Provider.of<AppData>(context)
                                                .pickuplocation
                                                .placeName
                                            : "HOME ADDRESS",
                                        //currentAddress,

                                        style: TextStyle(
                                            fontFamily: "Bold-brand",
                                            fontSize: 10.0),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              )),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: AnimatedSize(
              vsync: this,
              curve: Curves.bounceIn,
              duration: Duration(milliseconds: 160),
              child: Container(
                height: labourContainerHt,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 228, 228),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Color.fromARGB(255, 69, 99, 151),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/tyre.png",
                              width: 60.0,
                              height: 70.0,
                            ),
                            SizedBox(
                              width: 55.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Puncher Man",
                                  style: TextStyle(
                                      fontFamily: "Brand-Bold", fontSize: 20.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 55.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                switchcontainer();
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          color: Color.fromARGB(255, 219, 154, 12),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/Plumber1.png",
                                width: 60.0,
                                height: 70.0,
                              ),
                              SizedBox(
                                width: 55.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Plumber",
                                    style: TextStyle(
                                        fontFamily: "Brand-Bold",
                                        fontSize: 20.0),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 98.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchcontainer();
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          color: Color.fromARGB(255, 65, 133, 153),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/CarMachenic.png",
                                width: 60.0,
                                height: 70.0,
                              ),
                              SizedBox(
                                width: 55.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Car Ustad",
                                    style: TextStyle(
                                        fontFamily: "Brand-Bold",
                                        fontSize: 20.0),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 80.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchcontainer();
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: AnimatedSize(
                vsync: this,
                curve: Curves.bounceIn,
                duration: Duration(milliseconds: 160),
                child: Container(
                  height: requestContainerHT,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 228, 228),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7),
                        )
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.0,
                      ),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontFamily: "Brand-bold",
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Be Pataint..'),
                            WavyAnimatedText('Looking For The Labour'),
                          ],
                          isRepeatingAnimation: true,
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              width: 2.0,
                              color: Color.fromARGB(255, 141, 137, 137)),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 50.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            "Cancel Request",
                            style: TextStyle(
                                fontFamily: "Brand-Regular", fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
