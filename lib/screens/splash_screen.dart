import 'dart:async';

import 'package:flutter/material.dart';

import 'package:project4/screens/constants/constants_colors.dart';
import 'package:project4/screens/onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Onbording())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Color(ConstantColors.color1),
        ),
        const Positioned(
            top: 300,
            left: 30,
            child: Icon(
              Icons.cookie,
              size: 50,
              color: Colors.white,
            )),
        const Positioned(
          top: 300,
          left: 100,
          child: Text(
            "nector",
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
        )
      ]),
    );
  }
}
