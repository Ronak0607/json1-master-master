import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json/screen/userModel/Productmodel.dart';
import 'package:json/screen/userModel/UserModel.dart';

class UserProvider extends ChangeNotifier {
  List jsonList = [];
  List<dynamic> finalList = [];
  int i = 0;
  List lowPrice = [];

  getUserData() async {
    String jsonFile = await rootBundle.loadString("assets/json/data.json");
    var json = jsonDecode(jsonFile);

    finalList = json.map((e) => Productmodel.fromJson(e)).toList();

    notifyListeners();
  }

  void filterPricelow() {
    for (i = 1; i < finalList.length; i++)
      if (finalList[i].price! >= 0 && finalList[i].price! <= 100) {
        lowPrice.add(finalList[i]);
      }
  }
}
