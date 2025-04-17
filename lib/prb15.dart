import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), // Changed to teal
        useMaterial3: true,
      ),
      home: const DateTimePickerPage(),
    );
  }
}

// Stateful widget for the date and time picker screen
class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({super.key});

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPageState();
}

class _DateTimePickerPageState extends State<DateTimePickerPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Function to pick a date
  Future<void> _chooseDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Function to pick a time
  Future<void> _chooseTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Format the selected date
  String get dateText {
    if (selectedDate == null) {
      return 'No date chosen';
    }
    return DateFormat('yyyy-MM-dd').format(selectedDate!);
  }

  // Format the selected time
  String get timeText {
    if (selectedTime == null) {
      return 'No time chosen';
    }
    return selectedTime!.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50], // Changed to teal shade
      appBar: AppBar(
        backgroundColor: Colors.teal[700], // Changed to teal
        title: const Text('Choose Date & Time'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Slightly adjusted padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _chooseDate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Changed to teal
                foregroundColor: Colors.white,
              ),
              child: const Text('Pick a Date'),
            ),
            const SizedBox(height: 12),
            Text(
              dateText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _chooseTime,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Changed to teal
                foregroundColor: Colors.white,
              ),
              child: const Text('Pick a Time'),
            ),
            const SizedBox(height: 12),
            Text(
              timeText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}