import 'package:flutter/material.dart';

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Logo
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'uva',
                            style: TextStyle(
                              fontFamily: 'Hubballi',
                              color: Color(0xFF0D1F3C),
                              fontSize: 34,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Khel',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xFF0D1F3C),
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF0D1F3C),
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'assets/yk_logo_y.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Runner Image
              Center(
                child: Image.asset(
                  'assets/runner.png',
                  height: 300,
                ),
              ),
              const Spacer(),
              // Oval BG + Text
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // The Oval Image with updated opacity
                    Opacity(
                      // THIS VALUE HAS BEEN INCREASED
                      opacity: 0.5, // You can change this to 0.4, 0.6, etc.
                      child: Image.asset(
                        'assets/Floor--inject-1.png',
                        width: 300,
                      ),
                    ),
                    // The Text Column
                    const Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Push',
                                style: TextStyle(
                                  color: Color(0xFF8A24FF),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' Your Limits',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Record Your Personal Best',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // "Get Started" Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8A24FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}