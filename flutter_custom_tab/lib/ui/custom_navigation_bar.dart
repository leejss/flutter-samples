import 'package:flutter/material.dart';
import 'package:flutter_custom_tab/ui/custom_navigation_bar_item.dart';

class CustomNavigationBar extends StatelessWidget {
  // accetps childrens
  const CustomNavigationBar(
      {super.key, required this.childrens, required this.selectedIndex});

  final List<CustomNavigationBarItem> childrens;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: true,
        child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
              color: Colors
                  .white, // Consider setting a background color for better shadow visibility
            ),
            height: 80,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: childrens)),
      ),
    );
  }
}
