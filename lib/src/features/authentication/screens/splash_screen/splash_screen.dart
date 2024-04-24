import 'dart:async';
import 'package:calory/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => const WelcomeScreen())));
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset("assets/gif/iPhone 14 & 15 Pro Max - 45.json"),
          ),
        ],
      ),
    );
  }
}
