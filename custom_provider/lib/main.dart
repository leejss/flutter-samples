import 'package:custom_provider/provider.dart';
import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: CustomChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CustomChangeNotifierProvider.of<Counter>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You have pushed the button this many times:"),
              Text('${counter.count}',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.increment();
          },
          tooltip: "Increment",
          child: const Icon(Icons.add),
        ));
  }
}
