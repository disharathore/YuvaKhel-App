import 'package:flutter/material.dart';
import 'package:yuva_khel/login/ruler_picker.dart';
import 'package:yuva_khel/login/sport_interest_screens.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  // GK-based sensible range (you can change if you want)
  static const int minHeight = 120;
  static const int maxHeight = 220;
  int heightVal = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D2EE7),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: const [
                  Icon(Icons.assessment, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Assessment",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "What's your current height right now?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            const SizedBox(height: 18),

            Text(
              "$heightVal cm",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RulerPicker(
                minValue: minHeight,
                maxValue: maxHeight,
                initialValue: heightVal,
                unit: "cm",
                majorTick: 5,
                onValueChanged: (val) {
                  setState(() => heightVal = val);
                },
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check, color: Color(0xFF5D2EE7)),
                label: const Text(
                  "Continue",
                  style: TextStyle(
                      color: Color(0xFF5D2EE7),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const PrimarySportScreen(), // first screen in flow
    ),
  );
},

              ),
            ),
          ],
        ),
      ),
    );
  }
}
