import 'package:flutter/material.dart';
import 'package:project4/screens/constants/constants_colors.dart';
import 'package:project4/screens/login_screen.dart';

import 'package:project4/widgets/custom_buttons.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Image.asset('assets/1.jpg'),
        Positioned(
          top: 450,
          left: 75,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.7,
            child: const Text(
              "Welcome to our store",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        const Positioned(
            top: 550,
            left: 20,
            child: Text("Get your groceries as fast as one hour",
                style: TextStyle(fontSize: 18, color: Colors.white))),
        Positioned(
            top: 600,
            left: 50,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.08,
              child: GrButton(
                  callBack: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  icon: const Icon(Icons.arrow_circle_right),
                  bcolor: Color(ConstantColors.color2),
                  bName: "Get started"),
            ))
      ]),
    ));
  }
}
