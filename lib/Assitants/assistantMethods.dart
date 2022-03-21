import 'package:geolocator/geolocator.dart';
import 'package:getwork/Assitants/requestAssitant.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = "";
    Uri url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBdsMnH56pxZmplE3PK2A2hDMOZIEc5DKI");

    var response = await RequestAssitant.getRequest(url);
    if (response != "failed") {
      placeAddress = response["results"][0]["formatted_address"];
    }
    return placeAddress;
  }
}
