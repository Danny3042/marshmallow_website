// HomeScreen.dart
import 'package:flutter/material.dart';
import '../screens/privacy_policy.dart';
import '../navigation/navigation_rail.dart';


class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({required this.onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _DarkMode = false;

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
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('My Projects'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
           if (Scaffold.of(context).isDrawerOpen) {
             Navigator.of(context).pop();
           } else {
              Scaffold.of(context).openDrawer();
           }
          },
        ),
        actions: const <Widget>[
          VerticalDivider(thickness: 1, width: 1),
        ],
      ),
      body: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });

              if (index == 1) {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => PrivacyPolicy(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              }
            },
            onThemeChanged: (bool value) { widget.onThemeChanged(value); },
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