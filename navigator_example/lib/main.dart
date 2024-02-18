import 'package:flutter/material.dart';
import 'package:navigator_example/screens/categories_screen.dart';
import 'package:navigator_example/screens/home_screen.dart';
import 'package:navigator_example/screens/like_screen.dart';
import 'package:navigator_example/screens/my_screen.dart';
import 'package:navigator_example/screens/search_screen.dart';
import 'package:navigator_example/tab_navigator.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    ),
  );
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          TabNavigator(
            child: HomeScreen(),
          ),
          TabNavigator(
            child: CategoriesScreen(),
          ),
          TabNavigator(
            child: SearchScreen(),
          ),
          TabNavigator(
            child: LikeScreen(),
          ),
          TabNavigator(
            child: MyScreen(),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const <Widget>[
          // home, categoroies, search, like, my
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Like',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'My',
          ),
        ],
      ),
    );
  }
}
