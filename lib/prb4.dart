import 'package:flutter/material.dart';

void main() {
  runApp(const StyledTextApp());
}

class StyledTextApp extends StatelessWidget {
  const StyledTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextStyleScreen(),
    );
  }
}

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Styled Text AppBar')),
        backgroundColor: Colors.teal, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Large Bold Text',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange, 
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Medium Italic Text',
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.amber, 
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Underlined Blue Text',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                color: Colors.indigo, 
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Left-aligned Text',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.cyan, 
                  ),
                ),
                Text(
                  'Right-aligned Text',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}