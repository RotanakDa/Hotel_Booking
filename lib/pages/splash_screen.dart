import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/index.dart'; // Replace with the main page you want to navigate to.

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Define an animation that moves the logo from bottom to center
    _animation = Tween<double>(begin: 700, end: -10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // Start the animation
    _controller.forward();

    // Navigate to the Home screen after a delay
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => index()), // Replace with your homepage.
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.orangeAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: Image.asset('assets/images/TravelNest.png', width: 400, height: 400),
              );
            },
          ),
        ),
      ),
    );
  }
}
