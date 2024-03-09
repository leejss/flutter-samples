import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/screens/add_todo_screen.dart';
import 'package:todo_provider/todo/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<bool> _isHovering = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => _isHovering.value = true,
          onExit: (_) => _isHovering.value = false,
          child: ValueListenableBuilder(
            valueListenable: _isHovering,
            builder: (context, isHovering, child) {
              return AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isHovering ? Colors.blue : Colors.black,
                ),
                child: const Text(
                  'Todo List',
                ),
              );
            },
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration:
                          todo.completed ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      todoProvider.toggleCompleted(todo.id);
                    },
                  ),
                  onLongPress: () {
                    todoProvider.removeTodo(todo.id);
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddTodoScreen()));
                },
                child: const Text("Add Todo")),
          ),
        ],
      ),
    );
  }
}
