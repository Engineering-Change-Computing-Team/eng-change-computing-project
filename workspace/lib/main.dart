import 'package:flutter/material.dart';
import 'home.dart';

// The application currently has a home, map and results page.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
