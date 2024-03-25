import 'package:isar_todo/repository/todo_repository.dart';
import "package:provider/provider.dart";
import 'package:flutter/material.dart';

class ToodList extends StatelessWidget {
  const ToodList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoRepository = context.read<TodoRepository>();
    final allTodos = todoRepository.getAllTodos();

    return FutureBuilder(
        future: allTodos,
        // snapshot is result of async computation
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error state
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          }

          final todos = snapshot.data!.reversed.toList();

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
              );
            },
          );
        });

    // Get all todos and display them in a list using
  }
}
