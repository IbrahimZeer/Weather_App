import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String apiKey = "a6e99024bdeb42808ad140441231911";

  String location = 'Jerusalem'; //Default Location.
  String weatherIcon = 'heavycloud.png';
  int temperature = 0;
  int windSpeed = 0;
  int humidity = 0;
  int cloud = 0;
  String currentDate = '';
  List hourlyWeatherForecast = [];
  List dailyWeatherForecast = [];
  String currentWeatherStatus = '';
    //api call.
  String searchWeatherApi = "https://api.weatherapi.com/v1/forecast.json?key=" + apiKey + "days=7&q=";

  void fetchWeatherData(String searchText) async(
      try(
  var searchResult = await http.get(Uri.parse(searchWeatherAPI + searchText));

  final weatherData = Map<String, dynamic>.from(
  json.decode(searchResult.body) ?? 'There is No Data';)

  var locationData = weatherData['location'];
  var currentWeather = weatherData['current'];

  setState(() {

  })
   )
  )

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
    );
  }
}






