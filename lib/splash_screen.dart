import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8A24FF),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // NEW LOGO USING A STACK FOR PERFECT OVERLAP
            Stack(
              alignment: Alignment.center,
              children: [
                // Text is the base layer
                const Padding(
                  padding: EdgeInsets.only(left: 28.0), // Push text to the right
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'uva',
                          style: TextStyle(
                            fontFamily: 'Hubballi',
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Khel',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Image is the top layer, positioned in the center and then shifted left
                Padding(
                  padding: const EdgeInsets.only(right: 170.0), // Pull image to the left
                  child: Image.asset(
                    'assets/yk_logo_y.png',
                    height: 38,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Empowering Every Youth\nDiscovering Every Champion',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Work Sans',
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}