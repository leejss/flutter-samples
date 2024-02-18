import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: const Text(
          'Like Screen',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
