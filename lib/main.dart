// ============================================================
// Experiment 1: Working with Widgets and Layouts
// Author  : Flutter Lab
// Widgets : Row, Column, Container, Card, ListView
// ============================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// -------------------------------------------------------
// Root Application Widget
// -------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit List – Experiment 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // deep green
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const FruitListPage(),
    );
  }
}

// -------------------------------------------------------
// Data Model
// -------------------------------------------------------
class Fruit {
  final String emoji;
  final String name;
  final String price;
  final Color color;

  const Fruit({
    required this.emoji,
    required this.name,
    required this.price,
    required this.color,
  });
}

// -------------------------------------------------------
// Fruit Data
// -------------------------------------------------------
const List<Fruit> fruits = [
  Fruit(
    emoji: '🍎',
    name: 'Apple',
    price: '₹ 80 / kg',
    color: Color(0xFFFFEBEE),
  ),
  Fruit(
    emoji: '🍌',
    name: 'Banana',
    price: '₹ 40 / dozen',
    color: Color(0xFFFFFDE7),
  ),
  Fruit(
    emoji: '🥭',
    name: 'Mango',
    price: '₹ 120 / kg',
    color: Color(0xFFFFF8E1),
  ),
  Fruit(
    emoji: '🍊',
    name: 'Orange',
    price: '₹ 60 / kg',
    color: Color(0xFFFFF3E0),
  ),
  Fruit(
    emoji: '🍇',
    name: 'Grapes',
    price: '₹ 90 / kg',
    color: Color(0xFFF3E5F5),
  ),
];

// -------------------------------------------------------
// Main Page – uses Column + ListView
// -------------------------------------------------------
class FruitListPage extends StatelessWidget {
  const FruitListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        title: const Text(
          'Fruit Store',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        children: [
          // -- Experiment header banner --
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            // Row used for icon + text side by side
            child: Row(
              children: [
                const Icon(Icons.science, color: Colors.white, size: 32),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Experiment 1',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      'Widgets & Layouts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // -- Section label --
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.local_grocery_store,
                    size: 18, color: Color(0xFF2E7D32)),
                SizedBox(width: 6),
                Text(
                  'Available Fruits',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF33691E),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          // -- ListView of FruitCard widgets --
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                return FruitCard(fruit: fruits[index]);
              },
            ),
          ),

          // -- Footer --
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: const Color(0xFF2E7D32),
            child: const Text(
              'Flutter Lab Experiment  •  Widgets & Layouts',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------
// Reusable Custom Widget – FruitCard
// Uses: Card, Container, Row, Column
// -------------------------------------------------------
class FruitCard extends StatelessWidget {
  final Fruit fruit;

  const FruitCard({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Container(
        decoration: BoxDecoration(
          color: fruit.color,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        // Row: emoji | details column | price badge
        child: Row(
          children: [
            // Emoji inside a circular container
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(fruit.emoji, style: const TextStyle(fontSize: 30)),
              ),
            ),

            const SizedBox(width: 16),

            // Column: name + subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fruit.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Fresh & Organic',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),

            // Price badge container
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                fruit.price,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
