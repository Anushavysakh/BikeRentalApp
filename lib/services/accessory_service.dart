import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rent_a_bike/models/accessory.dart';

class AccessoryService with ChangeNotifier {
  List<Accessory> _accessories = [];

  List<Accessory> get accessories => _accessories;

  Future<List<Accessory>> getAccessories() async {
    final String jsonData = await rootBundle.loadString('assets/accessories.json');
    final List<dynamic> jsonList = json.decode(jsonData)['accessories'];
    _accessories = jsonList.map((json) => Accessory.fromJson(json)).toList();
    print("@@@@@@@@@@@@@@@@@@");
    print(_accessories.toString());
    print("@@@@@@@@@@@@@@@@@@");

    return jsonList.map((json) => Accessory.fromJson(json)).toList();
  }
}
