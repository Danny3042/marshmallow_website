import 'package:flutter/material.dart';
import '../navigation/navigation_rail.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  int _selectedIndex = 1; // Assuming Privacy Policy is at index 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: _selectedIndex, // Use the state variable here
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index; // Update the state variable here
              });

              if (index == 0) {
                Navigator.pushNamed(context, '/');
              }
              // Handle other destinations here
            },
            onThemeChanged: (bool value) {
              // Handle theme change here
            },
          ),
          const Expanded(
            child: Center(
              child: Text('Privacy Policy'),
            ),
          ),
        ],
      ),
    );
  }
}