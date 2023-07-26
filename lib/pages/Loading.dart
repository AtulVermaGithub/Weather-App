import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_the_weather/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Like The Weather",
              style: TextStyle(
                fontFamily: 'Font',
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Color(0xFF220141),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            const SpinKitSpinningLines(
              color: Color(0xFF220141),
              size: 80.0,
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 249, 136, 31),
    );
  }
}
