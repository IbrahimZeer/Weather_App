import 'package:weather_app/drawer.dart';
import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hourly Weather"),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
