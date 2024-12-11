import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/index.dart';
import 'package:hotel_booking_app/pages/splash_screen.dart';

class bookpage extends StatelessWidget {
  const bookpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFFA47C),
        automaticallyImplyLeading: false, // Removes the back arrow
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => index()),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
