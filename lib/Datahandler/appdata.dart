// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:getwork/Models/Address.dart';

class AppData extends ChangeNotifier {
  Address pickuplocation = new Address();

  void updatepicklocation(Address pickupaddress) {
    pickuplocation = pickupaddress;
    notifyListeners();
  }
}
