import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

// Two screens

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate =
        Router.of(context).routerDelegate as AppRouterDelegate;
    return Scaffold(
      appBar: AppBar(title: Text('First screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to second screen'),
          onPressed: () {
            routerDelegate.showSecondPage();
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate =
        Router.of(context).routerDelegate as AppRouterDelegate;
    return Scaffold(
      appBar: AppBar(title: Text('Second screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Pop page'),
          onPressed: () {
            routerDelegate.popRoute();
          },
        ),
      ),
    );
  }
}

class AppRoutePath {
  final String path;

  AppRoutePath.home() : path = '/';
  AppRoutePath.second() : path = '/second';
  AppRoutePath.unknown() : path = '/404';

  bool get isHome => path == '/';
  bool get isSecondPage => path == '/second';
  bool get isUnknown => path == '/404';
}

// Role
class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    final path = uri.path;

    if (path == '/') {
      return AppRoutePath.home();
    }

    if (path == '/second') {
      return AppRoutePath.second();
    }

    return AppRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isHome) {
      return RouteInformation(uri: Uri(path: '/'));
    }
    if (configuration.isSecondPage) {
      return RouteInformation(uri: Uri(path: '/second'));
    }
    return RouteInformation(uri: Uri(path: '/404'));
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;
  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  bool isSecondPage = false;

  @override
  AppRoutePath get currentConfiguration {
    if (isSecondPage) {
      return AppRoutePath.second();
    }
    return AppRoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('FirstPage'),
          child: FirstScreen(),
        ),
        if (isSecondPage)
          MaterialPage(
            key: ValueKey('SecondPage'),
            child: SecondScreen(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        isSecondPage = false;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration.isSecondPage) {
      isSecondPage = true;
    } else {
      isSecondPage = false;
    }
  }

  void showSecondPage() {
    isSecondPage = true;
    notifyListeners();
  }
}


// Read RouteInformation and Parse it