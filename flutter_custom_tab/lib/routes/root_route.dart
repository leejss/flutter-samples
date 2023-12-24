import 'package:flutter/material.dart';
import 'package:flutter_custom_tab/routes/home_screen.dart';
import 'package:flutter_custom_tab/routes/profile_screen.dart';
import 'package:flutter_custom_tab/ui/custom_navigation_bar.dart';
import 'package:flutter_custom_tab/ui/custom_navigation_bar_item.dart';

class RootRoute extends StatefulWidget {
  const RootRoute({super.key});

  @override
  State<RootRoute> createState() => _RootRouteState();
}

class _RootRouteState extends State<RootRoute> {
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildBody() {
    return IndexedStack(
      index: selectedIndex,
      children: const [HomeScreen(), ProfileScreen()],
    );
  }

  Widget buildTabNavigation() {
    return CustomNavigationBar(selectedIndex: selectedIndex, childrens: [
      CustomNavigationBarItem(
        iconData: Icons.home,
        label: 'Home',
        isSelected: selectedIndex == 0,
        onTap: () {
          onTap(0);
        },
      ),
      CustomNavigationBarItem(
        iconData: Icons.person,
        label: 'Profile',
        isSelected: selectedIndex == 1,
        onTap: () {
          onTap(1);
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildBody(), bottomNavigationBar: buildTabNavigation());
  }
}
