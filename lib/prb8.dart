import 'package:flutter/material.dart';

void main() {
  runApp(MyNavigationApp());
}

class MyNavigationApp extends StatelessWidget {
  const MyNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFB8E4F0), // Changed from 0xFFCCC6E4 to a light blue
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2E7D32), // Changed from 0xFF869706 to a forest green
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            _createDrawerItem(
              icon: Icons.image,
              label: 'Image Grid',
              onTap: () => _goToPage(context, ImageGallery()),
            ),
            _createDrawerItem(
              icon: Icons.settings,
              label: 'Settings',
              onTap: () => _goToPage(context, SettingsPage()),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }

  void _goToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Grid',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.indigo, // Changed from blue to indigo
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) => _createImageCard(),
        ),
      ),
    );
  }

  Widget _createImageCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://media.istockphoto.com/id/1436977595/photo/contemporary-art-collage-conceptual-image-young-woman-feeling-sadness-concept-of-retro-style.jpg?s=2048x2048&w=is&k=20&c=_CijUOQcPep5AJ_R2LKlvf9I73bvYIhVJiQh2PxUNgI=',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFE91E63), // Changed from 0xFFD043DF to a vibrant pink
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}