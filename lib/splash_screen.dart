import 'package:flutter/material.dart';
import 'package:coinboost/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Image.asset("assets/logo.png", height: 100),
      ),
    );
  }
}
