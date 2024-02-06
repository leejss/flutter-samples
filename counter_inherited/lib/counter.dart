import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  const CounterInheritedWidget({
    super.key,
    required super.child,
    required this.counter,
    required this.increment,
    required this.decrement,
  });

  final int counter;
  final VoidCallback increment;
  final VoidCallback decrement;

  // of method
  static CounterInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterInheritedWidget>()!;
  }

  // updateShouldNotify method
  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // inject
    return CounterInheritedWidget(
      counter: counter,
      increment: increment,
      decrement: decrement,
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // accessing the counter
    final counter = CounterInheritedWidget.of(context).counter;

    // Then, we can use the counter value in the UI
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Counter: $counter'),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: CounterInheritedWidget.of(context).decrement,
              child: const Text('Decrement'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: CounterInheritedWidget.of(context).increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ],
    );
  }
}
