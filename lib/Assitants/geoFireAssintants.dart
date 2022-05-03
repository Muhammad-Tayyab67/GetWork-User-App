import 'dart:ffi';
import 'dart:math';

import 'package:getwork/Models/nearbylabour.dart';

class GeofireAssistants {
  static List<nearbyLabours> OnlineLaboursList = [];
  static void RemoveLabourfromlist(String key) {
    int index = OnlineLaboursList.indexWhere((element) => element.key == key);
    OnlineLaboursList.remove(index);
  }

  static void UpdateLabourfromlist(nearbyLabours updatedlabour) {
    int index = OnlineLaboursList.indexWhere(
        (element) => element.key == updatedlabour.key);
    OnlineLaboursList[index].labourlatd = updatedlabour.labourlatd;
    OnlineLaboursList[index].labourlong = updatedlabour.labourlong;
  }

  static double createrandomNumber(int num) {
    var random = Random();
    int radnum = random.nextInt(num);
    return radnum.toDouble();
  }
}
