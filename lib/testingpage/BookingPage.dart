import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hotel_booking_app/pages/index.dart';
import 'package:hotel_booking_app/pages/splash_screen.dart';

void main() => runApp(const TestingBooking());

class TestingBooking extends StatelessWidget {
  const TestingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Room Booking Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BookingForm(),
    );
  }
}

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final List<String> _roomTypes = ['Single', 'Double', 'Suite'];
  String? _selectedRoomType;
  DateTimeRange? _dateRange;
  int _adults = 1;
  int _children = 0;
  int _rooms = 1;

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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Room Type ComboBox
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Room Type',
                border: OutlineInputBorder(),
              ),
              value: _selectedRoomType,
              items: _roomTypes
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRoomType = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Date Range Picker
            InkWell(
              onTap: () async {
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _dateRange = picked;
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Stay Dates',
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  _dateRange == null
                      ? 'Select dates'
                      : '${DateFormat('MM/dd/yyyy').format(_dateRange!.start)} - ${DateFormat('MM/dd/yyyy').format(_dateRange!.end)}',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Adults, Children, Rooms
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCounter('Adults', _adults, (newCount) {
                  setState(() {
                    _adults = newCount;
                  });
                }),
                _buildCounter('Children', _children, (newCount) {
                  setState(() {
                    _children = newCount;
                  });
                }, allowZero: true),
                _buildCounter('Rooms', _rooms, (newCount) {
                  setState(() {
                    _rooms = newCount;
                  });
                }),
              ],
            ),

            const SizedBox(height: 32),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_selectedRoomType == null || _dateRange == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                  return;
                }
                if (_adults < 1 || _rooms < 1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Adults and Rooms must be at least 1')),
                  );
                  return;
                }

                // Display the Booking Summary dialog
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Booking Summary', style: TextStyle(fontWeight: FontWeight.bold)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Room Details:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        const SizedBox(height: 8),
                        Text('Room Type: $_selectedRoomType'),
                        const SizedBox(height: 4),
                        Text(
                            'Stay Dates: ${DateFormat('MM/dd/yyyy').format(_dateRange!.start)} - ${DateFormat('MM/dd/yyyy').format(_dateRange!.end)}'),
                        const SizedBox(height: 16),
                        Text(
                          'Guest Details:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        const SizedBox(height: 8),
                        Text('Adults: $_adults'),
                        Text('Children: $_children'),
                        Text('Rooms: $_rooms'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => index()),
                          ); // Navigate to index()
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Submit'),
            ),

            SizedBox(height: 20,),

            _buildNewContact(),

          ],
        ),
      ),
    );
  }

  Widget _buildCounter(String label, int value, Function(int) onChanged, {bool allowZero = false}) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: value > (allowZero ? 0 : 1)
                  ? () => onChanged(value - 1)
                  : null,
            ),
            Text('$value', style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => onChanged(value + 1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewContact() {
    return Expanded(
      child: Container(
        height: 500,
        width: double.infinity,
        padding: const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            // Text(
            //   'Regular Room',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black87,
            //   ),
            // ),
            // const SizedBox(height: 12), // Spacing between title and images
            // First Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/room/room_0.jpg', // Replace with your image path
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            const SizedBox(height: 12), // Spacing between images
            // Second Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/room/room_0.jpg', // Replace with your image path
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/room/room_0.jpg', // Replace with your image path
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            const SizedBox(height: 12), // Spacing between images
            // Second Image

          ],
        ),
      ),
    );
  }

}
