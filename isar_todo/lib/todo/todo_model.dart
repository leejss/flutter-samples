import "package:isar/isar.dart";

part "todo_model.g.dart";

// required and nullable properties and default values

@collection
class Todo {
  Id id = Isar.autoIncrement;

  String title;
  String description;
  bool completed = false;
  DateTime createdAt = DateTime.now();
  DateTime? updatedAt;

  Todo({
    required this.title,
    required this.description,
  });
}

// Class for updating the todo
class UpdateTodo {
  final String? title;
  final String? description;
  final bool? completed;

  UpdateTodo({
    this.title,
    this.description,
    this.completed,
  });
}
