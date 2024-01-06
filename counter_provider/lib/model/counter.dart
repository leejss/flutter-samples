import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _value = 0;

  get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    notifyListeners();
  }
}
