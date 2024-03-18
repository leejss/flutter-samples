import 'package:flutter/material.dart';
import 'package:isar_todo/isar_service.dart';

void main() async {
  // Initialize Isar
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.instance.init();
}
