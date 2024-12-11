import 'package:flutter/material.dart';
import 'package:hotel_booking_app/testingpage/aboutus.dart';
import 'package:hotel_booking_app/testingpage/home.dart';
import 'package:hotel_booking_app/pages/index.dart';
import 'package:hotel_booking_app/pages/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
      // initialRoute: '/intro', // Set initial route to Intro Page
      // routes: {
      //   '/intro': (context) => const IntroPage(),
      //   '/home': (context) => const HomePage(),
      // },
    );
  }
}