// HomeScreen.dart
import 'package:flutter/material.dart';
import '../navigation/navigation_rail.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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
      ),
      body: Row(
        children: <Widget>[
          CustomNavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
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
          )
        ],
      ),
    );
  }
}