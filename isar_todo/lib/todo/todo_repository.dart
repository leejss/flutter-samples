import 'package:isar/isar.dart';
import 'package:isar_todo/todo/todo_model.dart';

class TodoRepository {
  // Repository accepts the instance of the data source => db connection
  final Isar _isar;
  TodoRepository(this._isar);

  // Repository methods - CRUD operations
  // Create - Insert new todo into the database
  Future<void> addTodo(Todo newTodo) async {
    await _isar.writeTxn(() => _isar.todos.put(newTodo));
  }

  // Read - Get all todos from the database
  Future<List<Todo>> getAllTodos() async {
    final allTodos = await _isar.todos.where().findAll();
    return allTodos;
  }

  // Read by id - Get a todo by its id
  Future<Todo?> getTodoById(int id) async {
    final todo = await _isar.todos.get(id);
    return todo;
  }

  // Update - Update a todo (subset of properties) in the database
  // => Partial updates
  Future<void> updateTodo(int id, UpdateTodo todo) async {
    // Get the todo by its id
    final todoToUpdate = await _isar.todos.get(id);
    if (todoToUpdate != null) {
      // Update the todo properties
      if (todo.title != null) {
        todoToUpdate.title = todo.title!;
      }
      if (todo.description != null) {
        todoToUpdate.description = todo.description!;
      }
      if (todo.completed != null) {
        todoToUpdate.completed = todo.completed!;
      }
      // Save the updated todo
      await _isar.writeTxn(() => _isar.todos.put(todoToUpdate));
    }
  }

  // Delete - Remove a todo from the database
  Future<void> deleteTodoById(int id) async {
    await _isar.writeTxn(() => _isar.todos.delete(id));
  }
}
