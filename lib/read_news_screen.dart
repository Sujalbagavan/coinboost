import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

class ReadNewsScreen extends StatefulWidget {
  @override
  _ReadNewsScreenState createState() => _ReadNewsScreenState();
}

class _ReadNewsScreenState extends State<ReadNewsScreen> {
  int _timeLeft = 30;
  Timer? _timer;
  bool hasWon = false;

  final Map<String, dynamic> newsItem = {
    "title": "🌎 Global Economy Booms in 2025!",
    "image": "https://picsum.photos/400/200",
    "content": """The global economy is experiencing an unprecedented surge, with stock markets across the world reaching record highs. A combination of technological advancements, progressive economic policies, and increased international trade has led to a period of sustained growth and prosperity.

📈 Unstoppable Market Growth
Major stock exchanges, from Wall Street to Asia’s Nikkei and Europe’s FTSE, have witnessed massive gains as investor confidence soars. Companies in artificial intelligence, automation, and renewable energy sectors are seeing skyrocketing valuations, driving global economic expansion. The rise of AI-powered solutions has drastically increased productivity, optimizing supply chains, reducing operational costs, and accelerating innovation across industries.

💡 AI and Automation – The Game Changers
AI-driven automation has led to a productivity revolution. Businesses are adopting AI-powered tools for decision-making, predictive analysis, and efficiency improvements, reducing reliance on traditional labor-intensive processes. Automation in manufacturing, logistics, and financial services has slashed operational costs, leading to higher profit margins and increased economic activity.

🌍 Global Trade and Policy Reforms
Governments worldwide have signed historic trade agreements that have eliminated many of the barriers that previously hindered international business. Cross-border investments have reached an all-time high, with companies expanding into new markets with ease. Additionally, major economies have implemented tax reforms, incentivizing entrepreneurship and foreign investments.

🏡 Improved Job Market and Consumer Confidence
Despite initial fears of automation replacing jobs, the boom has created an influx of new opportunities. The demand for AI engineers, automation specialists, cybersecurity professionals, and data scientists has surged. As a result, wages have risen, and unemployment rates have hit historic lows. Consumers, empowered by better job security and higher incomes, are spending more on travel, luxury goods, and technology, further fueling economic growth.

🔋 Sustainable Energy Revolution
Green energy initiatives have reached new heights, with solar, wind, and hydrogen energy replacing fossil fuels at an accelerated rate. Global investments in clean energy have made sustainable solutions more affordable, reducing energy costs for both businesses and households. Nations leading in renewable energy production are experiencing major economic boosts as they dominate the global energy market.

📊 Future Predictions: A Golden Decade Ahead?
Economists predict that if current trends continue, the next decade could mark a new golden age of economic stability and technological progress. With rapid digitalization, AI-driven economies, and sustainable energy adoption, the world is on track to achieving long-term prosperity. However, experts warn that geopolitical tensions, climate change, and potential financial bubbles must be managed carefully to ensure continued success.

For now, optimism is at an all-time high as the world embraces a future shaped by technology, innovation, and economic resilience. 🚀"""
  };

  /// Starts the reading timer
  void startReading() {
    _timer?.cancel(); // Cancel existing timer if any
    setState(() {
      _timeLeft = 30;
      hasWon = false;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() => _timeLeft--);
      } else {
        timer.cancel();
        setState(() => hasWon = true);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startReading();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("📰 Read & Win!", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    newsItem["image"],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  newsItem["title"],
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 60), // Space for timer
                    child: Text(
                      newsItem["content"],
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Timer Positioned at the Bottom Center
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "⏳ Time left: $_timeLeft sec",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),

          // Win Animation and Replay Button
          if (hasWon)
            Container(
              color: Colors.black.withOpacity(0.8), // Overlay
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset("assets/winner.json", width: 250, repeat: false),
                    SizedBox(height: 20),
                    Text(
                      "🎉 Congratulations! You've completed the news!",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: startReading,
                      child: Text("Replay", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
