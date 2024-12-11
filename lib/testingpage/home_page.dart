import 'package:flutter/material.dart';
import 'package:hotel_booking_app/testingpage/home.dart';
import 'package:hotel_booking_app/testingpage/homepage.dart';
import 'package:hotel_booking_app/pages/index.dart';
import '../pages/splash_screen.dart';
import '../pages/splash_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Added background color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set your desired height
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            backgroundColor: Color(0xFFFFA47C),
            elevation: 0.0,
            flexibleSpace: Stack(
              children: [
                // "Hello User" positioned at the bottom-left
                Positioned(
                  left: 16,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => index()), // Replace with your homepage.
                      );
                    },
                    child: Text(
                      'Hello User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                // Profile image positioned at the center-right
                Positioned(
                  right: 16,
                  top: 35,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()), // Replace with your homepage.
                      );
                    },
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,// Align text to the left
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Let's start your",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add spacing between the two texts
            ],
          ),
          SizedBox(height: 1,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,// Align text to the left
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Holiday Together!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add spacing between the two texts
            ],
          ),
          SizedBox(height: 10),
          // Search TextField moved to the bottom
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.11),
                      blurRadius: 40,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Color(0xffDDDADA),
                      fontSize: 16,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Container(
                height: 150,
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIcon(context, Icons.hotel, "Hotel List", HotelScreen()),
                    _buildIcon(context, Icons.calendar_today, "Booking", BookingScreen()),
                    _buildIcon(context, Icons.fastfood, "Restaurant", FoodScreen()),
                    _buildIcon(context, Icons.shopping_cart, "Shopping", ShoppingScreen()),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "HelloWorld",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Replace with your data length
                  itemBuilder: (context, index) {
                    return _buildHotelCard(index);
                  },
                ),
              ),
            ],
          ),
        ],
      ),



    );
  }
}

Widget _buildIcon(BuildContext context, IconData icon, String label, Widget destination) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedScaleWidget(
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xFFFFA47C),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 36),
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    ),
  );
}

class AnimatedScaleWidget extends StatefulWidget {
  final Widget child;

  const AnimatedScaleWidget({required this.child});

  @override
  _AnimatedScaleWidgetState createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1.1,
    );
  }

  void _startAnimation() {
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startAnimation(),
      child: ScaleTransition(
        scale: _controller,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HotelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hotel Screen")),
      body: Center(child: Text("Welcome to the Hotel Screen!")),
    );
  }
}

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Screen")),
      body: Center(child: Text("Welcome to the Booking Screen!")),
    );
  }
}

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Screen")),
      body: Center(child: Text("Welcome to the Food Screen!")),
    );
  }
}

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Screen")),
      body: Center(child: Text("Welcome to the Shopping Screen!")),
    );
  }
}

Widget _buildHotelCard(int index) {
  return Container(
    width: 150,
    margin: const EdgeInsets.only(right: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/hotel_$index.jpg'), // Replace with actual images
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Hotel Name $index', // Replace with actual data
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Location', // Replace with actual data
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    ),
  );
}