import 'package:flutter/material.dart';
import 'package:navigator_example/screens/new_product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewProductScreen(),
            ),
          );
        },
        child: const Text('Go to new product screen'),
      )),
    );
  }
}
