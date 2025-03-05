import 'package:flutter/material.dart';
import 'package:coinboost/splash_screen.dart';

void main() {
  runApp(CoinBoostApp());
}

class CoinBoostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Removes the debug banner
      title: 'CoinBoost',
      theme: ThemeData(
        primarySwatch: Colors.orange,  // Set a theme color
        scaffoldBackgroundColor: Colors.white,  // Background color
      ),
      home: SplashScreen(),  // First screen to show
    );
  }
  
}
