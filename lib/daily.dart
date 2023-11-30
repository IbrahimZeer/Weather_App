import 'package:flutter/cupertino.dart';
import 'package:weather_app/drawer.dart';
import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Weather"),),
      drawer: const CustomDrawer(),
    );
  }
}
