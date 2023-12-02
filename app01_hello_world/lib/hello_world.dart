import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello World',
        style: TextStyle(
          fontSize: 48,
          color: Colors.pink[200],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
