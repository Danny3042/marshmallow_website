import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme/Theme.dart';

class CustomNavigationRail extends StatefulWidget {
  final ValueChanged<int> onDestinationSelected;
  final int selectedIndex;

  const CustomNavigationRail({super.key, 
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
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
    NavigationRailDestination(
      icon: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) => IconButton(
          icon: Icon(themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode),
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        ),
      ),
      label: const Text('Toggle Theme'),
    ),
    // other destinations...
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // If the screen width is less than 600, return an empty Container
    if (screenWidth < 600) {
      return Container();
    }

    // Otherwise, return the NavigationRail
    return NavigationRail(
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      labelType: NavigationRailLabelType.selected,
      destinations: _navRailDestinations,
    );
  }
}