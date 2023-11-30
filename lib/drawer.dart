import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _drawerState();
}

class _drawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Weather app" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , color: Colors.white),),
            height: 150,
            color: Colors.blue,
          ),

          Container(
            padding: EdgeInsets.only(top: 15),
            child: MaterialButton(
              textColor: Colors.black,
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("home");
              },
              child: Text("Home"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: MaterialButton(
              textColor: Colors.black,
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("hour");
              },
              child: Text("Hourli Forecast"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: MaterialButton(
              textColor: Colors.black,
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("day");
              },
              child: Text("Daily Forecast"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: MaterialButton(
              textColor: Colors.black,
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("city");
              },
              child: Text("Places"),
            ),
          ),
        ],
        ),
      ),
    );
  }
}