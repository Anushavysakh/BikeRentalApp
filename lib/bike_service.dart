import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'bike.dart';

class BikeService with ChangeNotifier{


  List<Bike> _bikes = [];

  List<Bike> get bikes => _bikes;

  Future<List<Bike>> getBikes() async {
    final String jsonData = await rootBundle.loadString('assets/bikes.json');
    final List<dynamic> jsonList = json.decode(jsonData)['bikes'];
    _bikes = jsonList.map((json) => Bike.fromJson(json)).toList();

    return jsonList.map((json) => Bike.fromJson(json)).toList();
  }

}
