import 'package:flutter/material.dart';

class RewardLevelsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rewards = [
    {"level": 1, "min_bitcoin": 500, "winnings": 50},
    {"level": 2, "min_bitcoin": 1000, "winnings": 100},
    {"level": 3, "min_bitcoin": 1500, "winnings": 150},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rewarding Levels")),
      body: ListView.builder(
        itemCount: rewards.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("Level ${rewards[index]['level']}"),
              subtitle: Text("Minimum Bitcoin: ₹${rewards[index]['min_bitcoin']} \nWinnings: ₹${rewards[index]['winnings']}"),
            ),
          );
        },
      ),
    );
  }
}
