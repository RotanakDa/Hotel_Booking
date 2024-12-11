import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EAF6), // Light blue background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30), // Spacer for top padding
              Column(
                children: [
                  const Text(
                    "Flutter App",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50), // Darker text color
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "The best way to start yout mobile career",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF607D8B), // Subtitle text color
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/Pokeball.png', // Placeholder image
                    height: 300,
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
