import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      // key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => child,
        );
      },
    );
  }
}
