import 'package:custom_bottom_nav/custom_bottom_navigation.dart';
import 'package:custom_bottom_nav/tab_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: TabPage(
      child: Scaffold(
          bottomNavigationBar: CustomBottomNavigation(), body: TabPageView()),
    ));
  }
}
