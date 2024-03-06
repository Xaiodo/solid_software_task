import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// This is the main application widget.
class MainApp extends StatelessWidget {
  /// MainApp constructor with parameter key.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Background Color Change App',
      home: Scaffold(
        body: Center(
          child: Text(
            'Hey there!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
