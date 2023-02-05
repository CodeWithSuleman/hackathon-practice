import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project4/screens/bottom_navigation_bar.dart';

import 'package:project4/screens/login_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: (FirebaseAuth.instance.currentUser != null)
        //     ? const SplashScreen()
        //     : const LogIn(),
        home: LogIn());
  }
}
