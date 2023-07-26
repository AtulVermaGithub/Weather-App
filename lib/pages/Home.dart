// import 'dart:js_interop';
import 'dart:math';
// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'dart:convert' as convert;
import 'package:like_the_weather/Worker/worker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int temp = 0;
  String wind = "";
  String humidity = "";
  String des = "";
  String name = "";
  String region = "";
  String tempFeel = "";
  String prec = "";
  String cloud = "";
// String temp ="Loading...";
  String location = "new york";
  void fetchData() async {
    worker data = worker(location);
    await data.getData();
    // if (data.getData()){print("object");}
    setState(() {
      // location = location.toUpperCase();
      tempFeel = data.tempFeel.toString();
      temp = data.temp.round();
      wind = data.airSpeed.toString();
      humidity = data.humidity.toString();
      des = data.description.toString();
      name = data.name.toString();
      region = data.region.toString();
      prec = data.prec.toString();
      cloud = data.cloud.toString();
      // region = region.toUpperCase();
    });

    // print("Location: ${instance.location}");
    // print("Humidity: ${instance.humidity}");
    // print("Wind Speed: ${instance.airSpeed}");
    // print("Temperature: ${instance.temp}");
    // print("Description: ${instance.description}");
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    TextEditingController searchController = new TextEditingController();
    var cityName = [
      'Mumbai',
      'Delhi',
      'Bangalore',
      'Hyderabad',
      'Chennai',
      'Kolkata',
      'Ahmedabad',
      'Pune',
      'Jaipur',
      'Lucknow',
      'New York',
      'Paris',
      'London',
      'Tokyo',
      'Sydney'
    ];
    final _random = new Random();
    var city = cityName[_random.nextInt(cityName.length)];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: H,
          padding: EdgeInsets.symmetric(horizontal: H / 31.5),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 255, 207, 167),
                Color.fromARGB(255, 249, 136, 31)
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFffebd0),
                    border: Border.all(
                        color: Color.fromARGB(255, 249, 136, 31), width: 2),
                    borderRadius: BorderRadius.circular(33),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: H / 20,
                        color: Colors.black87,
                      ),
                      Expanded(
                        child: TextField(
                          onSubmitted: (_) {
                            if (searchController.text.isNotEmpty) {
                              setState(() {
                                location = searchController.text;
                                fetchData();
                              });
                            }
                          },
                          controller: searchController,
                          autocorrect: true,
                          autofillHints: cityName,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: "Search '$city'",
                              border: InputBorder.none),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // print(searchController.text);
                          if (searchController.text.isNotEmpty) {
                            setState(() {
                              location = searchController.text;
                              fetchData();
                            });
                          }
                        },
                        child: Icon(
                          Icons.search_sharp,
                          size: H / 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "$name\n$region",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            //Have to add Shadow
                            height: .999,
                            fontSize: W / 9.8,
                            // fontFamily: "Inter",
                            // fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Tue, Jun 30",
                      style: TextStyle(fontSize: W / 32.6, fontFamily: "Inter"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/Full_rain.png",
                      height: W / 2.3,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "$temp",
                              style: TextStyle(
                                  fontSize: W / 5.3,
                                  // fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Inter"),
                            ),
                            const Text(
                              "°C",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Container(
                          width: W / 3,
                          child: Text("$des",
                              style: TextStyle(
                                // fontFamily: "Inter",
                                letterSpacing: 1,
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: W / 5.5,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(15)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Feels Like",
                        style: TextStyle(
                          fontSize: W / 24,
                        ),
                      ),
                      Text(
                        "$tempFeel°C",
                        style: TextStyle(
                            fontSize: W / 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: W / 5.5,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(15)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wind Speed",
                        style: TextStyle(
                          fontSize: W / 24,
                        ),
                      ),
                      Text(
                        "$wind km/h",
                        style: TextStyle(
                            fontSize: W / 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: W / 5.5,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(15)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Humidity",
                        style: TextStyle(
                          fontSize: W / 24,
                        ),
                      ),
                      Text(
                        "$humidity%",
                        style: TextStyle(
                            fontSize: W / 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: W / 5.5,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(15)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chances of Rain",
                        style: TextStyle(
                          fontSize: W / 24,
                        ),
                      ),
                      Text(
                        "$prec%",
                        style: TextStyle(
                            fontSize: W / 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: W / 5.5,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(15)),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cloud",
                        style: TextStyle(
                          fontSize: W / 24,
                        ),
                      ),
                      Text(
                        "$cloud%",
                        style: TextStyle(
                            fontSize: W / 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
