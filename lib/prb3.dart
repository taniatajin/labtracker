import 'package:flutter/material.dart';

void main() {
  runApp(const MyListApp());
}

class MyListApp extends StatelessWidget {
  const MyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListScreen(),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of custom colors
    final List<Color> tileColors = [
      Colors.blue.shade700,
      Colors.purple.shade600,
      Colors.teal.shade600,
      Colors.orange.shade800,
      Colors.red.shade700,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List AppBar',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.tealAccent.shade700,
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: 15,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext ctx, int idx) {
          return Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            decoration: BoxDecoration(
              color: tileColors[idx % tileColors.length],
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                'Item ${idx + 1}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'DMSans',
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}