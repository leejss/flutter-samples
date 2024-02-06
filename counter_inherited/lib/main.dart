import 'package:counter_inherited/counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    );
  }
}


// how to center the widget in the screen? 
// https://stackoverflow.com/questions/46582684/how-to-center-a-widget-in-flutter