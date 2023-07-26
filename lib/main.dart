// import 'package:like_the_weather/Worker/worker.dart';
import 'package:flutter/material.dart';
import 'package:like_the_weather/pages/Home.dart';
import 'package:like_the_weather/pages/Loading.dart';
import 'package:like_the_weather/pages/Location.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.white,
    ),

    // home: Home(),
    routes: {
      "/": (context) => Home(),
      "/home": (context) => Home(),
      "/location": (context) => Location()
    },
  ));
}
