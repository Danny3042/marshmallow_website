// HomeScreen.dart
import 'package:flutter/material.dart';
import '../navigation/navigation_rail.dart';


class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  HomeScreen({required this.onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;

  final List<Map<String, String>> googleTechnologies = [
    {
      'name': 'Flutter',
      'description': 'A UI toolkit for building natively compiled applications for different platforms such as iOS, Android, Desktop and the Web.',
    },
    {
      'name': 'TensorFlow',
      'description': 'An end-to-end open source platform for machine learning which can be adapted to mobile phones.',
    },
    // Add more technologies as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Technologies'),
        actions: const <Widget>[
          VerticalDivider(thickness: 1, width: 1),
        ],
      ),
      body: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (index) {
              // Handle navigation here
            }, onThemeChanged: (bool value) { widget.onThemeChanged(value); },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: googleTechnologies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(googleTechnologies[index]['name']!),
                  subtitle: Text(googleTechnologies[index]['description']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}