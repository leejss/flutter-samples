// Model and the state

import 'package:flutter/foundation.dart';

class TodoItem {
  final String id;
  final String title;
  bool completed;

  TodoItem({required this.id, required this.title, this.completed = false});
}

class TodoProvider with ChangeNotifier {
  final List<TodoItem> _todos = [];
  List<TodoItem> get todos => _todos;

  void addTodo(String title) {
    _todos.add(TodoItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        completed: false));
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void toggleCompleted(String id) {
    // Find matched todo
    final todo = _todos.firstWhere((element) => element.id == id);

    // Toggle the completed status
    todo.completed = !todo.completed;
    notifyListeners();
  }
}
