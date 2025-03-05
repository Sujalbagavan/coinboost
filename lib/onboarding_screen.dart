import 'package:flutter/material.dart';
import 'package:coinboost/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Animation setup
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    if (_phoneController.text.length == 10) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 10-digit phone number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color.fromARGB(255, 255, 200, 0), Colors.white],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/Animation.json", height: 220), // Add your animation here
                SizedBox(height: 20),
                Text(
                  "Welcome to CoinBoost",
                  style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: "Enter Your Mobile Number",
                      labelStyle: TextStyle(color: const Color.fromARGB(179, 0, 0, 0)),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.phone, color: const Color.fromARGB(179, 0, 0, 0)),
                    ),
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _navigateToHome,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 251, 180, 0),
                    foregroundColor: Colors.blue.shade900,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text("Continue", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
