import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Cards Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CardListScreen(),
    );
  }
}

class CardListScreen extends StatelessWidget {
  CardListScreen({Key? key}) : super(key: key);

  final List<Item> _items = [
    Item(
      image: 'https://picsum.photos/300/200?random=1',
      title: 'Mountain View',
      subtitle: 'Scenic Landscape',
      description: 'Experience breathtaking mountain ranges with guided tours. Ideal for nature enthusiasts.',
    ),
    Item(
      image: 'https://picsum.photos/300/200?random=2',
      title: 'Beach Resort',
      subtitle: 'Tropical Getaway',
      description: 'Unwind on stunning beaches with clear waters. Enjoy water sports and sunset vibes.',
    ),
    Item(
      image: 'https://picsum.photos/300/200?random=3',
      title: 'City Tour',
      subtitle: 'Urban Exploration',
      description: 'Explore vibrant city life with tours of historic and modern landmarks.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Cards'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: CustomCard(
              image: _items[index].image,
              title: _items[index].title,
              subtitle: _items[index].subtitle,
              description: _items[index].description,
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String image;
  final String title;
  final String subtitle;
  final String description;

  Item({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

class CustomCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;

  CustomCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _elevationAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _scaleAnim = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _elevationAnim = Tween<double>(begin: 4.0, end: 8.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) => _controller.forward();
  void _onTapUp(TapUpDetails details) => _controller.reverse();
  void _onTapCancel() => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: Card(
              elevation: _elevationAnim.value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      widget.image,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.subtitle,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          widget.description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey.shade700,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}