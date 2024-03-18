import 'package:isar/isar.dart';
import 'package:isar_todo/todo/todo_model.dart';
import "package:path_provider/path_provider.dart";

// Isar service that open and close the db
class IsarService {
  // late keyword ensure that the variable is initialized before it is used
  late Isar _db;

  // Private constructor
  IsarService._();

  static final IsarService _instance = IsarService._();

  // Getter for instance
  static IsarService get instance {
    return _instance;
  }

  // Getter for db
  Isar get db {
    return _db;
  }

  Future<Isar> init() async {
    _db = await openIsar();
    return _db;
  }

  Future<Isar> openIsar() async {
    // Check if the instance is empty
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([TodoSchema], directory: dir.path);
      return isar;
    }

    // If not empty, return the instance
    return Future.value(Isar.getInstance());
  }

  Future<void> closeIsar() async {
    await _db.close();
  }
}
