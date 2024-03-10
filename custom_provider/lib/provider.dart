import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomChangeNotifierProvider<T extends ChangeNotifier>
    extends StatefulWidget {
  final T Function(BuildContext) create;
  final Widget child;

  const CustomChangeNotifierProvider({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  static T of<T extends ChangeNotifier>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<_CustomInheritedNotifier<T>>()!;
    return provider.notifier;
  }

  @override
  _CustomChangeNotifierProviderState<T> createState() =>
      _CustomChangeNotifierProviderState<T>();
}

class _CustomChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<CustomChangeNotifierProvider<T>> {
  late T _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = widget.create(context);
    _notifier.addListener(_handleNotifierUpdate);
  }

  @override
  void dispose() {
    _notifier.removeListener(_handleNotifierUpdate);
    _notifier.dispose();
    super.dispose();
  }

  void _handleNotifierUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _CustomInheritedNotifier<T>(
      notifier: _notifier,
      child: widget.child,
    );
  }
}

class _CustomInheritedNotifier<T extends ChangeNotifier>
    extends InheritedWidget {
  final T notifier;

  const _CustomInheritedNotifier({
    Key? key,
    required this.notifier,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CustomInheritedNotifier<T> oldWidget) {
    return true;
  }
}
