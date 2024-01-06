import 'package:counter_provider/model/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Provider Demo'),
        ),
        body: const Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CounterText(), CounterButton()],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the counter object
    final counter = Provider.of<Counter>(context);
    return Text('${counter.value}',
        style: Theme.of(context).textTheme.headlineLarge);
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the counter object
    final counter = Provider.of<Counter>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => counter.increment(),
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () => counter.decrement(),
          child: const Text('Decrement'),
        ),
      ],
    );
  }
}
