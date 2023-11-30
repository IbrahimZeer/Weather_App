import 'package:weather_app/city.dart';
import 'package:weather_app/daily.dart';
import 'package:weather_app/hourly.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DisplayMovie(),
      routes: {
        'home':(context) => DisplayMovie(),
        'hour':(context) => const HourlyForecast(),
        'day':(context) => const DailyForecast(),
        'city':(context) => const CityWeather(),
      },
    );
  }
}
