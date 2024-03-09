import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/app.dart';
import 'package:todo_provider/todo/todo_provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;

  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: child,
    );
  }
}

void main() {
  runApp(const AppProvider(child: MyApp()));
}
