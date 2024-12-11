import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/Aboutus.dart';
import 'package:hotel_booking_app/testingpage/book_page.dart';
import 'package:hotel_booking_app/pages/splash_screen.dart';
import 'package:hotel_booking_app/testingpage/BookingPage.dart';

import 'BookingPage.dart';

class index extends StatelessWidget {
  const index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFFA47C),
        automaticallyImplyLeading: false, // Removes the back arrow
        title: Text(
          "Travel Nest",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 32,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.redAccent,
            width: double.infinity,
            height: 1000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Let's start your Holiday Together!",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSearchBar(),
                const SizedBox(height: 30),
                _buildCategorySection(context),
                const SizedBox(height: 30),
                _buildRecommendedSection(),
                const SizedBox(height: 30,),
                _buildNewContact()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar(){
    return BottomNavigationBar(
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (e) {
        print(e); // Handle navigation or change of page here
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home', // Optional label for the item
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Account',
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
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
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for hotels, cities...',
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }



  Widget _buildCategorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCategoryIcon(context, Icons.bookmark_add, 'Booking', Booking()),
            _buildCategoryIcon(context, Icons.restaurant, 'Restaurants', AboutUsPage()),
            _buildCategoryIcon(context, Icons.shopping_bag, 'Shopping', SplashScreen()),
            _buildCategoryIcon(context, Icons.info, 'About Us', AboutUsPage()),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryIcon(BuildContext context, IconData icon, String label, Widget targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFFFA47C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildRecommendedSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Lovely Rooms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
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
    );
  }

  Widget _buildHotelCard(int index) {
    // List of hotel names
    final List<Map<String, String>> hotels = [
      {'name': 'Reglar Bedroom', 'location': '1-2 People'},
      {'name': 'Double Bedroom', 'location': '1-4 People'},
      {'name': 'King Size Room', 'location': '1-2 People'},
      {'name': 'Deluxe Room', 'location': '2-4 People'},
      {'name': 'Luxury Room', 'location': '2-4 People'},
    ];

    Map<String, String> hotel = (index < hotels.length)
        ? hotels[index]
        : {'name': 'Hotel $index', 'location': 'Unknown Location'};

    return GestureDetector(
      onTap: () {
        // Handle the click event here
        print('Clicked on ${hotel['name']}');
        // Example: Navigate to another page
        // Navigator.push(context, MaterialPageRoute(builder: (_) => HotelDetailsPage(hotel: hotel)));
      },
      child: Container(
        width: 180,
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
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/room/room_$index.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hotel['name']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                hotel['location']!,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewContact(){
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFA47C),

          ),
      ),
    );
  }

}
