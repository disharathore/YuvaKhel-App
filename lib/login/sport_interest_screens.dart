import 'package:flutter/material.dart';

class PrimarySportScreen extends StatefulWidget {
  const PrimarySportScreen({super.key});

  @override
  State<PrimarySportScreen> createState() => _PrimarySportScreenState();
}

class _PrimarySportScreenState extends State<PrimarySportScreen> {
  String? _selectedSport;
  final List<String> _sports = [
    "BasketBall",
    "Badminton",
    "Hockey",
    "Cricket",
    "VolleyBall"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3D7FF), Color(0xFFF6E9FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Primary Sport Interest?",
                style: TextStyle(
                  color: Color(0xFF3E2C5A),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: _sports.map((sport) {
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: RadioListTile<String>(
                        activeColor: const Color(0xFF8E6CD9),
                        title: Text(
                          sport,
                          style: const TextStyle(
                            color: Color(0xFF3E2C5A),
                            fontSize: 18,
                          ),
                        ),
                        value: sport,
                        groupValue: _selectedSport,
                        onChanged: (value) {
                          setState(() {
                            _selectedSport = value;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              _buildContinueButton(
                context,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SecondarySportScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondarySportScreen extends StatefulWidget {
  const SecondarySportScreen({super.key});

  @override
  State<SecondarySportScreen> createState() => _SecondarySportScreenState();
}

class _SecondarySportScreenState extends State<SecondarySportScreen> {
  String? _selectedSport;
  final List<String> _sports = [
    "BasketBall",
    "Badminton",
    "Hockey",
    "Cricket",
    "VolleyBall"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3D7FF), Color(0xFFF6E9FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Secondary Sport Interest? (optional)",
                style: TextStyle(
                  color: Color(0xFF3E2C5A),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: _sports.map((sport) {
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: RadioListTile<String>(
                        activeColor: const Color(0xFF8E6CD9),
                        title: Text(
                          sport,
                          style: const TextStyle(
                            color: Color(0xFF3E2C5A),
                            fontSize: 18,
                          ),
                        ),
                        value: sport,
                        groupValue: _selectedSport,
                        onChanged: (value) {
                          setState(() {
                            _selectedSport = value;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              _buildContinueButton(
                context,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PreferredTrainingCenterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreferredTrainingCenterScreen extends StatelessWidget {
  const PreferredTrainingCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3D7FF), Color(0xFFF6E9FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Preferred Training Center (optional)",
                style: TextStyle(
                  color: Color(0xFF3E2C5A),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: controller,
                style: const TextStyle(color: Color(0xFF3E2C5A)),
                decoration: InputDecoration(
                  hintText: "Enter Center Name",
                  hintStyle: const TextStyle(color: Color(0xFF8E6CD9)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Spacer(),
              _buildContinueButton(
                context,
                onPressed: () {
                  // TODO: Final Submit
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Common AppBar
AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Color(0xFF3E2C5A)),
      onPressed: () => Navigator.pop(context),
    ),
    title: Row(
      children: [
        Image.asset(
          'assets/yk_logo_y.png',
          height: 28,
        ),
        const SizedBox(width: 8),
        const Text(
          "YuvaKhel",
          style: TextStyle(color: Color(0xFF3E2C5A), fontSize: 18),
        ),
      ],
    ),
  );
}

/// Common Continue Button
Widget _buildContinueButton(BuildContext context,
    {required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8E6CD9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        shadowColor: Colors.black26,
        elevation: 4,
      ),
      onPressed: onPressed,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Continue",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    ),
  );
}
