import 'package:flutter/material.dart';
import 'package:yuva_khel/login/ruler_picker.dart';
import 'height_screen.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  // GK-based sensible range (you can change if you want)
  static const int minWeight = 30;
  static const int maxWeight = 150;
  int weight = 62;

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

            // Question text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "What's your current weight right now?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            const SizedBox(height: 18),

            // current value display
            Text(
              "$weight Kg",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Ruler (placed slightly upper in center)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RulerPicker(
                minValue: minWeight,
                maxValue: maxWeight,
                initialValue: weight,
                unit: "Kg",
                majorTick: 5,
                onValueChanged: (val) {
                  setState(() => weight = val);
                },
              ),
            ),

            const SizedBox(height: 8),

            // Continue button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward, color: Color(0xFF5D2EE7)),
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
                    MaterialPageRoute(builder: (_) => const HeightScreen()),
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
