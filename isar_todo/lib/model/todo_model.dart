import "package:isar/isar.dart";

part 'todo_model.g.dart';

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

class UpdateTodo {
  String? title;
  String? description;
  bool? completed;
}
