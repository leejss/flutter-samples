import 'package:flutter/material.dart';
import 'package:isar_todo/model/todo_model.dart';
import 'package:isar_todo/repository/todo_repository.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // dispose when the widget is removed from the tree
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoRepository = context.read<TodoRepository>();

    return Column(children: <Widget>[
      TextFormField(
        controller: _titleController,
        decoration: const InputDecoration(
          labelText: 'Title',
        ),
      ),
      TextFormField(
        controller: _descriptionController,
        decoration: const InputDecoration(
          labelText: 'Description',
        ),
      ),
      ElevatedButton(
        onPressed: () async {
          // Call the addTodo method from the IsarService class
          // with the title and description
          // then clear the text fields
          // then show a snackbar
          await todoRepository.addTodo(Todo(
            title: _titleController.text,
            description: _descriptionController.text,
          ));

          _titleController.clear();
          _descriptionController.clear();

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Todo added')),
            );
          }
        },
        child: const Text('Add Todo'),
      ),
    ]);
  }
}
