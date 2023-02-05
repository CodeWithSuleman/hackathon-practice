import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project4/screens/card_screen.dart';
import 'package:project4/screens/signup_screen.dart';
import 'package:project4/widgets/custom_buttons.dart';

import 'constants/constants_colors.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void logIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email == '' || password == '') {
      print("Please fill the field");
    } else {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        print("User Log-In!");
        if (credential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CardScreen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        log(e.code.toString() as num);
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  _handleGoogleBtn() {
    _signInWithGoogle().then((user) {
      print("\nUser Login with google successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CardScreen()),
      );
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/4.jpg',
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const Text(
                "LogIn",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              const Text(
                "Enter Your Email an Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.011),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: "Enter Email",
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: "Enter Password",
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Color(ConstantColors.color2), fontSize: 16),
                      )),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                child: GrButton(
                    callBack: () {
                      logIn();
                    },
                    icon: const Icon(Icons.login),
                    bcolor: Color(ConstantColors.color2),
                    bName: "LogIn"),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.011),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: GrButton(
                      callBack: () {
                        _handleGoogleBtn();
                      },
                      icon: Icon(Icons.facebook),
                      bcolor: Color(ConstantColors.color3),
                      bName: "LogIn with Google")),
              Row(
                children: [
                  const Text(
                    "Did not have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: Text(
                        "SignUp?",
                        style: TextStyle(
                            color: Color(ConstantColors.color2), fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
