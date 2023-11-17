import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 48,
              color: Colors.pink[200],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
