import 'package:flutter/material.dart';
import 'package:coinboost/read_news_screen.dart';
import 'package:coinboost/reward_levels_screen.dart';
import 'package:coinboost/play_game_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COINBOOST",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notification button press
            },
          ),
          
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserProfile(context),
            SizedBox(height: 24),
            _buildDailyRewards(),
            SizedBox(height: 24),
            _buildTaskSection(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/profile.png'),
          radius: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text("Level 01", style: TextStyle(fontSize: 16)),
                SizedBox(width: 16),
                Icon(Icons.wallet, color: Colors.green, size: 20),
                SizedBox(width: 4),
                Text("\$25.00", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.grey),
          onPressed: () {
            // Handle settings button press
          },
        ),
      ],
    );
  }

  Widget _buildDailyRewards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Claim your Daily Reward",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(6, (index) {
              return Container(
                margin: EdgeInsets.only(right: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: index == 2 ? Colors.orangeAccent : Colors.white,
                    foregroundColor: index == 2 ? Colors.white : Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Handle reward claim
                  },
                  child: Text(
                    "\$2\nAD",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Do Tasks, Earn Rewards",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          "Complete tasks and earn rewards instantly!",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(height: 16),
        _buildTaskCard(
          context,
          "Play Game",
          "Earn up to \$10 by playing exciting games.",
          "assets/game_tubnail.png",
          PlayGameScreen(),
        ),
        _buildTaskCard(
          context,
          "Read News",
          "Stay updated with the latest news and earn \$5.",
          "assets/news.png",
          ReadNewsScreen(),
        ),
      ],
    );
  }

  Widget _buildTaskCard(BuildContext context, String title, String description, String imagePath, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, blurRadius: 6),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Rewards"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      onTap: (index) {
        
      },
    );
  }
}