// ignore_for_file: camel_case_types
import 'package:like_the_weather/keys/api_key.dart';
import 'dart:convert' as convert;
import 'dart:ffi';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
final _key = ApiKey().apiKey;

class worker {
  //  String location;
  //  humidity, temp, airSpeed, description;
  String location;

  // Constructor
  worker(this.location) {
    location = this.location;
  }

  String? humidity,
      tempFeel,
      airSpeed,
      description,
      error,
      name,
      region,
      prec,
      cloud;
  double temp = 00;
  Future<void> getData() async {
    try {
      Response response = await http.get(Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=$_key&q=$location'));

      Map data = convert.jsonDecode(response.body);
      temp = data["current"]["temp_c"];
      tempFeel = data["current"]["feelslike_c"].toString();
      humidity = data["current"]["humidity"].toString();
      airSpeed = data["current"]["wind_kph"].toString();
      description = data["current"]['condition']['text'].toString();
      name = data["location"]["name"].toString();
      region = data["location"]["country"].toString();
      prec = (data["current"]["precip_in"] * 100).toString();
      cloud = data["current"]["cloud"].toString();
      // location = location.toString();

      // String location = data.toString();
    } catch (e) {
      name = "'$location'";
      region = "Not Found";
    }
  }
}

// worker run = worker();
