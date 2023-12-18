import 'package:flutter/cupertino.dart';


class Weather {
  String name;
  double temp;
  String icon;

  Weather({required this.name , required this.temp , required this.icon});

  factory Weather.fromJson(dynamic json){
    return Weather(name: json['location']['name'], temp: json['current']['temp_c'], icon: json['current']['condition']['icon']);
  }
}