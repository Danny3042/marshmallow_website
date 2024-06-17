import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/navigation_rail.dart';
import 'home_screen.dart';

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
        automaticallyImplyLeading: false,
        title: const Text('Privacy Policies'),
      ),
      body: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });

              if (index == 0) {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => HomeScreen(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              }
              // Handle other destinations here
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('HealthCompose Privacy Policy'),
                      subtitle: Text(
                          'A health and fitness coach app that helps you stay fit and healthy.'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('Go to Details'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/HealthComposePrivacyPolicyDetails');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}