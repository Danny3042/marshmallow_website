// navigation_rail.dart
import 'package:flutter/material.dart';

class CustomNavigationRail extends StatefulWidget {
  final ValueChanged<int> onDestinationSelected;
  final ValueChanged<bool> onThemeChanged;
  final int selectedIndex;

  CustomNavigationRail({
    required this.onDestinationSelected,
    required this.onThemeChanged,
    required this.selectedIndex,
  });

  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      labelType: NavigationRailLabelType.selected,
      destinations: [
        const NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('First'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.book),
          label: Text('Second'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.star_border),
          selectedIcon: Icon(Icons.star),
          label: Text('Third'),
        ),
        NavigationRailDestination(
          icon: IconButton(
            icon: Icon(_isDarkMode ? Icons.brightness_3 : Icons.brightness_7),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
              widget.onThemeChanged(_isDarkMode);
              widget.onDestinationSelected(_isDarkMode ? 1 : 0);
            },
          ),
          label: Text('Toggle Theme'),
        ),
      ],
    );
  }
}