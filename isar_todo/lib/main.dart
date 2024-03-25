import 'package:flutter/material.dart';
import 'package:isar_todo/isar_service.dart';
import 'package:isar_todo/repository/todo_repository.dart';
import 'package:isar_todo/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize Isar
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await IsarService.instance.init();
  final repository = TodoRepository(isar);

  runApp(Provider(
    create: (context) => repository,
    child: const MyApp(),
  ));
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Isar Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Isar Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}
