import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/Modules/movie.dart';
import 'package:weather_app/drawer.dart';

class DisplayMovie extends StatefulWidget {
  @override
  State<DisplayMovie> createState() => _DisplayMovieState();
}

class _DisplayMovieState extends State<DisplayMovie> {
  late Future<Movie> futureMovie;
  Future<Movie> getData() async {
    http.Response response = await http.get(Uri.parse("https://www.omdbapi.com/?t=The%20Lord%20of%20the%20Rings:%20The%20Fellowship%20of%20the%20Ring&apikey=501ca7ee"));
    if (response.statusCode == 200){
      var jsonObject = jsonDecode(response.body);
      Movie movie = Movie.fromJson(jsonObject);
      return movie;
    }
    else{
      throw Exception("Can't access the API!");
    }
}


@override
void initState() {
  super.initState();
  futureMovie = getData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("weather app"),),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
          future: futureMovie,
          builder: (context , snapshot){
            if(snapshot.hasData){
              Movie? movie = snapshot.data;
              return ListView.builder(
                // itemCount: snapshot.data!. ,
                itemBuilder: (context , index){
                  return ListTile(

                  );
                }
              );
            }else if (snapshot.hasError){
              return const Text("Future");
            }
            else{
              return const Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}


