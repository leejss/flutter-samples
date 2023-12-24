import 'package:flutter/material.dart';

class CustomNavigationBarItem extends StatelessWidget {
  const CustomNavigationBarItem(
      {super.key,
      required this.iconData,
      required this.label,
      required this.isSelected,
      required this.onTap});

  final IconData iconData;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  Widget buildAnimatedIcon(BuildContext context, Color color) {
    return AnimatedTheme(
      data: Theme.of(context).copyWith(
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: color,
            ),
      ),
      duration: const Duration(milliseconds: 300),
      child: Icon(iconData),
    );
  }

  Widget buildAnimatedText(Color color) {
    return AnimatedDefaultTextStyle(
      style: TextStyle(color: color),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor = Theme.of(context).primaryColor;
    Color inactiveColor = Colors.grey;

    Color color = isSelected ? activeColor : inactiveColor;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildAnimatedIcon(context, color),
          buildAnimatedText(color),
        ],
      ),
    );
  }
}
