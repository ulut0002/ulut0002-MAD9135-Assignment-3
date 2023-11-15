import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Images and Assets",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 1.05,
          ),
        ),
      ),
      body: Center(),
    );
  }
}
