import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Design',
      theme: ThemeData(primarySwatch: Colors.teal), // Changed to teal
      home: const ContainerDesignScreen(),
    );
  }
}

class ContainerDesignScreen extends StatelessWidget {
  const ContainerDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Design'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Changed to teal
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.teal.shade200, // Changed to teal shade
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Tania',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
