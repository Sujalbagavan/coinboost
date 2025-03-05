import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int secondsLeft = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (secondsLeft > 0) {
        setState(() {
          secondsLeft--;
        });
        startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text("Discover the Top 5 Hairstyles According to Your Face Shape"),
                ),
                ListTile(
                  title: Text("Most Beautiful Things to Do in 2025 for an Amazing Experience"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: secondsLeft == 0
                ? ElevatedButton(
                    onPressed: () {},
                    child: Text("Claim"),
                  )
                : Text("Time Left: $secondsLeft sec"),
          ),
        ],
      ),
    );
  }
}
