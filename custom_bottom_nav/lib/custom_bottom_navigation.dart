import 'package:custom_bottom_nav/tab_page.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPageInheritedWidget.of(context)!;
    // final selectedIndex = tabPage.selectedIndex;
    final onItemTapped = tabPage.onItemTapped;
    const activeColor = Colors.red;
    const inactiveColor = Colors.black;
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        )),
        child: Row(
          children: [
            // onPressed will change selectedIndex

            // and IconButton will change the color of the icon
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.home),
                color: tabPage.selectedIndex == 0 ? activeColor : inactiveColor,
                onPressed: () {
                  onItemTapped(0);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.search),
                color: tabPage.selectedIndex == 1 ? activeColor : inactiveColor,
                onPressed: () {
                  onItemTapped(1);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.add),
                color: tabPage.selectedIndex == 2 ? activeColor : inactiveColor,
                onPressed: () {
                  onItemTapped(2);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.favorite),
                color: tabPage.selectedIndex == 3 ? activeColor : inactiveColor,
                onPressed: () {
                  onItemTapped(3);
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.person),
                color: tabPage.selectedIndex == 4 ? activeColor : inactiveColor,
                onPressed: () {
                  onItemTapped(4);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
