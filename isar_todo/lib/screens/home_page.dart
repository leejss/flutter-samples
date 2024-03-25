import 'package:flutter/material.dart';
import 'package:isar_todo/todo/add_todo.dart';
import 'package:isar_todo/todo/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Home page is two parts. List of todo and add todo
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isar Todo'),
      ),
      body: const Center(
        child: Column(
          children: [AddTodo(), Expanded(child: ToodList())],
        ),
      ),
    );
  }
}
