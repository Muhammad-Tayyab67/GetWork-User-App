// ignore_for_file: file_names, unnecessary_new

import 'package:geolocator/geolocator.dart';
import 'package:getwork/Assitants/requestAssitant.dart';
import 'package:getwork/Config.dart';
import 'package:getwork/Datahandler/appdata.dart';
import 'package:getwork/Models/Address.dart';
import 'package:provider/provider.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAddress = "Home Address";
    String st1, st2, st3, st4;
    // Uri url = Uri.parse(
    //   "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBdsMnH56pxZmplE3PK2A2hDMOZIEc5DKI");
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url =
        '$_host?key=$Mapkey&language=en&latlng=${position.longitude},${position.longitude}';

    var response = await RequestAssitant.getRequest(url);
    if (response != "failed") {
      //placeAddress = response["results"][0]["formatted_address"];
      st1 = response["results"][0]["address_components"][0]["long_name"];
      st2 = response["results"][0]["address_components"][1]["long_name"];
      st3 = response["results"][0]["address_components"][5]["long_name"];
      st4 = response["results"][0]["address_components"][6]["long_name"];
      placeAddress = st1 + st2 + st3 + st4;
      Address pickupaddress = new Address();
      pickupaddress.latitude = position.latitude;
      pickupaddress.longitude = position.longitude;
      pickupaddress.placeName = placeAddress;
      Provider.of<AppData>(context, listen: false)
          .updatepicklocation(pickupaddress);
    }
    return placeAddress;
  }
}
