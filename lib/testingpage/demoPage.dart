import 'package:flutter/material.dart';

import 'home_page.dart';

class Demopage extends StatelessWidget {
  const Demopage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello Room',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {
             Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (context) => HomePage()), // Replace with your homepage.
             );
            },
          ),
        ],
      ),
        body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore Destinations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 30),
              _buildCategorySection(context),
              const SizedBox(height: 30),
              _buildRecommendedSection(),
            ],
          ),
        ),
      ),
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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCategoryIcon(context, Icons.hotel, 'Hotels'),
            _buildCategoryIcon(context, Icons.flight, 'Flights'),
            _buildCategoryIcon(context, Icons.restaurant, 'Restaurants'),
            _buildCategoryIcon(context, Icons.tour, 'Tours'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryIcon(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Navigate to the appropriate screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigate to $label')),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.orange,
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
            'Recommended for You',
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
    );
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
}
