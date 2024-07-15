import 'package:flutter/material.dart';
import 'package:kampus_haven/widgets/feature_tile.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191B),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Welcome to Kampus Haven.',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Icon(
                  Icons.school,
                  color: Colors.blueAccent,
                  size: 100,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Find the best off-campus accommodation near your campus for free.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                  ),
                  child: const Text('Get Started'),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Why Choose Us?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const FeatureTile(
                  icon: Icons.money_off,
                  title: 'Free Service',
                  description: 'Our service is completely free for students.',
                ),
                const FeatureTile(
                  icon: Icons.location_on,
                  title: 'Prime Locations',
                  description:
                      'All our accommodations are near major campuses.',
                ),
                const FeatureTile(
                  icon: Icons.security,
                  title: 'Secure and Safe',
                  description:
                      'We ensure all accommodations meet safety standards.',
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
