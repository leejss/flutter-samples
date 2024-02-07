import 'package:flutter/material.dart';

class TabPageInheritedWidget extends InheritedWidget {
  const TabPageInheritedWidget({
    super.key,
    required super.child,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  // static of method and updateShouldNotify method

  // of method return the nearest TabPageInheritedWidget
  static TabPageInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabPageInheritedWidget>();
  }

  @override
  bool updateShouldNotify(TabPageInheritedWidget oldWidget) {
    // rebuilds when the selected index changes
    return selectedIndex != oldWidget.selectedIndex;
  }
}

// TabPage holds the state of the selected index

class TabPage extends StatefulWidget {
  const TabPage({super.key, required this.child});
  final Widget child;

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabPageInheritedWidget(
      selectedIndex: selectedIndex,
      onItemTapped: _onItemTapped,
      child: widget.child,
    );
  }
}

class TabPageView extends StatelessWidget {
  const TabPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = TabPageInheritedWidget.of(context)!.selectedIndex;

    // Render different pages based on the selected index

    // array with texts
    final pages = [
      'Home',
      'Search',
      'Plus',
      'Heart',
      'Profile',
    ];

    return Center(
        child: Text(
      pages[selectedIndex],
      style: const TextStyle(fontSize: 30),
    ));
  }
}
