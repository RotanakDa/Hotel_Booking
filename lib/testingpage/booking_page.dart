import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/index.dart';
import 'package:hotel_booking_app/pages/splash_screen.dart';


class booking_page extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // Room type options for the combo box
    final List<String> roomTypes = ['Single', 'Double', 'Suite', 'Family'];

    // Form fields controllers
    final TextEditingController adultsController = TextEditingController();
    final TextEditingController childrenController = TextEditingController();
    final TextEditingController roomsController = TextEditingController();

    DateTimeRange? selectedDateRange;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Room type combo box
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Room Type',
                      border: OutlineInputBorder(),
                    ),
                    items: roomTypes
                        .map((type) => DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    ))
                        .toList(),
                    onChanged: (value) {
                      // Handle room type selection
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a room type';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Date range picker
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Select Date Range',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      selectedDateRange = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                    },
                    validator: (value) {
                      if (selectedDateRange == null) {
                        return 'Please select a date range';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Adults field
                  TextFormField(
                    controller: adultsController,
                    decoration: InputDecoration(
                      labelText: 'Number of Adults',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the number of adults';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Children field
                  TextFormField(
                    controller: childrenController,
                    decoration: InputDecoration(
                      labelText: 'Number of Children',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the number of children';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Rooms field
                  TextFormField(
                    controller: roomsController,
                    decoration: InputDecoration(
                      labelText: 'Number of Rooms',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the number of rooms';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Submit button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Form submitted!')),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
