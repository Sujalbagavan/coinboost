import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class PlayGameScreen extends StatefulWidget {
  @override
  _PlayGameScreenState createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen> {
  final List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple];
  final List<String> colorNames = ["RED", "BLUE", "GREEN", "YELLOW", "PURPLE"];

  late String targetColorName;
  late Color displayedColor;
  int score = 0;
  bool gameWon = false;

  @override
  void initState() {
    super.initState();
    generateNewColor();
  }

  void generateNewColor() {
    int colorIndex = Random().nextInt(colors.length);
    int textColorIndex = Random().nextInt(colors.length);

    setState(() {
      targetColorName = colorNames[colorIndex]; // The color name to match
      displayedColor = colors[textColorIndex];  // The text color (misleading sometimes)
    });
  }

  void checkAnswer(String selectedColor) {
    if (selectedColor == targetColorName) {
      setState(() {
        score += 5;
      });
    } else {
      setState(() {
        score -= 3;
      });
    }

    if (score >= 30) {
      setState(() {
        gameWon = true;
      });
    } else {
      generateNewColor();
    }
  }

  void restartGame() {
    setState(() {
      score = 0;
      gameWon = false;
      generateNewColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for a clean look
      appBar: AppBar(
        title: Text(
          "Tap the Right Color",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // Back button color
      ),
      body: Center(
        child: gameWon
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/winner.json",
                    width: 280,
                    height: 350,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "🎉 You Won! 🎉",
                    style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: restartGame,
                    child: Text(
                      "Play Again",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tap the correct color",
                    style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.yellow[50], // Light yellow background for the target text
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      targetColorName,
                      style: TextStyle(
                        fontSize: 32,
                        color: displayedColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: colors.map((color) {
                      String colorText = colorNames[colors.indexOf(color)];
                      return ElevatedButton(
                        onPressed: () => checkAnswer(colorText),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          minimumSize: Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          colorText,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.yellow[50], // Light yellow background for the score
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      "Score: $score",
                      style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}