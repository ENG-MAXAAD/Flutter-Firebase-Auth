import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 20, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text(
            'Welcome Home Page Sir',
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
