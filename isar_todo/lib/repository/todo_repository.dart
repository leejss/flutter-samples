import 'package:isar/isar.dart';
import 'package:isar_todo/model/todo_model.dart';

class TodoRepository {
  // constructor and CRUD methods
  final Isar _isar;
  TodoRepository(this._isar);
  Future<int> addTodo(Todo newTodo) async {
    return await _isar.writeTxn(() => _isar.todos.put(newTodo));
  }

  Future<List<Todo>> getAllTodos() async {
    final allTodos = await _isar.todos.where().findAll();
    return allTodos;
  }

  Future<Todo?> getTodoById(int id) async {
    final todo = await _isar.todos.get(id);
    return todo;
  }

  Future<void> updateTodo(int id, UpdateTodo todo) async {
    final todoToUpdate = await _isar.todos.get(id);
    if (todoToUpdate != null) {
      if (todo.title != null) {
        todoToUpdate.title = todo.title!;
      }
      if (todo.description != null) {
        todoToUpdate.description = todo.description!;
      }
      if (todo.completed != null) {
        todoToUpdate.completed = todo.completed!;
      }
      await _isar.writeTxn(() => _isar.todos.put(todoToUpdate));
    }
  }

  Future<void> deleteTodoById(int id) async {
    await _isar.writeTxn(() => _isar.todos.delete(id));
  }
}
