import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/drawer.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("City Weather"),
        ),
        drawer: const CustomDrawer(),
        body: Container(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) {
                return null;
              }),
        ));
  }
}
