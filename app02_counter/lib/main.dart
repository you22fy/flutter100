import 'package:app02_counter/flutter_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
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
        appBar: AppBar(
          title: Text(
            'FlutterCounter',
            style: TextStyle(
              color: Colors.pink.shade900,
              fontSize: 24,
            ),
          ),
        ),
        body: ColoredBox(
          color: Colors.pink.shade100,
          child: const Center(
            child: FlutterCounter(),
          ),
        ),
      ),
    );
  }
}
