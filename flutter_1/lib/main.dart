import 'package:flutter/material.dart';

void main() {
  runApp(const BurgerQueenApp());
}

class BurgerQueenApp extends StatelessWidget {
  const BurgerQueenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burger Queen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Burger Queen'),
            const Icon(Icons.fastfood), // Icône de burger
            const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'), // Avatar
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Contenu principal'),
      ),
    );
  }
}