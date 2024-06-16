import 'package:flutter/material.dart';

class CustomNavigationRail extends StatefulWidget {
  final ValueChanged<int> onDestinationSelected;
  final ValueChanged<bool> onThemeChanged;
  final int selectedIndex;

  const CustomNavigationRail({
    required this.onDestinationSelected,
    required this.onThemeChanged,
    required this.selectedIndex,
  });

  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  bool _isDarkMode = false;

  List<NavigationRailDestination> get _navRailDestinations => [
    const NavigationRailDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: Text('Home'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.privacy_tip_outlined),
      selectedIcon: Icon(Icons.privacy_tip),
      label: Text('Policies'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.star_border),
      selectedIcon: Icon(Icons.star),
      label: Text('Third'),
    ),
    NavigationRailDestination(
      icon: IconButton(
        icon: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
        onPressed: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
          widget.onThemeChanged(_isDarkMode);
        },
      ),
      label: const Text('Toggle Theme'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final isPhone = deviceSize.width < 600; // Adjust the threshold as needed

    if (isPhone) {
      // Use Drawer for phone screens
      return Drawer(
        child: ListView(
          children: _navRailDestinations.map((destination) {
            return ListTile(
              leading: destination.icon,
              title: destination.label,
              selected: _navRailDestinations.indexOf(destination) == widget.selectedIndex,
              onTap: () => widget.onDestinationSelected(_navRailDestinations.indexOf(destination)),
            );
          }).toList(),
        ),
      );
    } else {
      // Use NavigationRail for larger screens
      return NavigationRail(
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: widget.onDestinationSelected,
        labelType: NavigationRailLabelType.selected,
        destinations: _navRailDestinations,
      );
    }
  }
}