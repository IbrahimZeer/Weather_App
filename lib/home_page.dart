import 'dart:convert';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather_app/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityController =
      TextEditingController(); //city name input.
  Constants constants = Constants();
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
  String searchWeatherAPI =
      "https://api.weatherapi.com/v1/forecast.json?key=${apiKey}days=7&q=";

  void fetchWeatherData(String searchText) async {
    try {
      var searchResult =
          await http.get(Uri.parse(searchWeatherAPI + searchText));

      final weatherData = Map<String, dynamic>.from(
          json.decode(searchResult.body) ?? 'There is No Data');

      var locationData = weatherData['location'];
      var currentWeather = weatherData['current'];

      setState(() {
        location = getShortLocationName(locationData["name"]);
        var parsedDate = DateTime.parse(locationData["localtime"])
            .toString()
            .substring(0, 10);
        var newDate =
            DateFormat('MMMMEEEED').format(DateTime.parse(parsedDate));
        currentDate = newDate;

        //update weather.

        currentWeatherStatus = currentWeather['condition']['text'];
        weatherIcon = currentWeather['condition']['icon'];
        temperature = currentWeather['temp_c'].toInt();
        windSpeed = currentWeather['wind_kph'].toInt();
        humidity = currentWeather['humidity'].toInt();
        cloud = currentWeather['cloud'].toInt();

        //Forcast data.
        dailyWeatherForecast = weatherData['forecast']['forecastday'];
        hourlyWeatherForecast = dailyWeatherForecast[0]['hour'];
      });
    } catch (e) {
      //print e for debugging.
    }
  }

  //function to return the first two words of the location name.
  static String getShortLocationName(String s) {
    List<String> wordList = s.split(" ");

    if (wordList.isNotEmpty) {
      if (wordList.length > 1) {
        return "${wordList[0]} ${wordList[1]}";
      } else {
        return wordList[0];
      }
    } else {
      return "";
    }
  }

  @override
  void initState() {
    fetchWeatherData(location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        color: constants.primaryColor.withOpacity(.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: size.height * .7,
                decoration: BoxDecoration(
                  gradient: constants.linearGradientBlue,
                  boxShadow: [
                    BoxShadow(
                      color: constants.primaryColor.withOpacity(.5),
                      blurRadius: 8,
                      spreadRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/pin.png',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              cityController.clear();
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                        controller:
                                            ModalScrollController.of(context),
                                        child: Container(
                                          height: size.height * .2,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          child: Column(children: [
                                            SizedBox(
                                              width: 70,
                                              child: Divider(
                                                thickness: 3.5,
                                                color: constants.primaryColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              onChanged: (searchText) {
                                                fetchWeatherData(searchText);
                                              },
                                              controller: cityController,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color: constants.primaryColor,
                                                ),
                                                suffix: GestureDetector(
                                                  onTap: () =>
                                                      cityController.clear(),
                                                  child: Icon(
                                                    Icons.clear,
                                                    color:
                                                        constants.primaryColor,
                                                  ),
                                                ),
                                                hintText:
                                                    'Search City e.g. Jerusalem',
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: constants
                                                              .primaryColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ));
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                    SizedBox(
                      child: Image.asset('images/heavycloud.png'),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
