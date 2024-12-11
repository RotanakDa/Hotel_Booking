import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/index.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text('About Us',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        backgroundColor: Color(0xFFFFA47C),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image with Border Radius and Shadow
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/aboutus.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Our Story Section
            buildStyledContainer(
              title: 'Our Story',
              content:
              'Travel Nest was founded to revolutionize the way people discover and book accommodations. '
                  'Our journey began with a dream to make travel seamless and joyful for everyone, everywhere.',
            ),

            // Goal Section
            buildStyledContainer(
              title: 'Our Goal',
              content:
              'To connect travelers with the best stays worldwide, offering convenience, affordability, and comfort.',
            ),

            // Vision Section
            buildStyledContainer(
              title: 'Our Vision',
              content:
              'To become the go-to platform for travel and hospitality, empowering travelers to explore the world with ease.',
            ),

            // Mission Section
            buildStyledContainer(
              title: 'Our Mission',
              content:
              'To provide a user-centric booking experience with innovative features and exceptional service, ensuring every journey is memorable.',
            ),

            // Additional Content Section
            buildStyledContainer(
              title: 'What Sets Us Apart?',
              content:
              '- A wide selection of accommodations: From budget-friendly to luxury resorts.\n'
                  '- Real-time availability and transparent pricing.\n'
                  '- Customized recommendations tailored to your needs.\n'
                  '- 24/7 support to assist you at every step of your journey.',
            ),

            // Footer
            Center(
              child: Text(
                'Thank you for choosing Travel Nest!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFA47C),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStyledContainer({required String title, required String content}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFA47C),
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
