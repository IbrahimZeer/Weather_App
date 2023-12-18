import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/Modules/Weather.dart';
import 'package:weather_app/drawer.dart';

class DisplayWeather extends StatefulWidget {
  @override
  State<DisplayWeather> createState() => _DisplayWeatherState();
}

class _DisplayWeatherState extends State<DisplayWeather> {
  // late Future<Weather> futureWeather;
  Future<Weather> getData() async {
    http.Response response = await http.get(Uri.parse("http://api.weatherapi.com/v1/current.json?key=1a1b60f8101749309eb135952230912&q=London"));
    if (response.statusCode == 200){
      var jsonObject = jsonDecode(response.body);
      Weather weather = Weather.fromJson(jsonObject);
      print(weather);
      return weather;
    }
    else{
      throw Exception("Can't access the API!");
    }
}


@override
void initState() {
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("weather app"),),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: getData(),
        builder: (context , snap ) {
          if(snap.hasData){
            Weather? weather = snap.data;
            return Center(child: Column(children: [
              Text(weather!.name),
              Text('${weather.temp}'),
              Image.network(weather.icon)
            ],),);
          }else if (snap.hasError){
            return Text("something went wrong");
          }else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}


