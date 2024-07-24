import 'package:flutter/material.dart';
import 'package:marshmallow_website/screens/ContactForm.dart';
import 'package:provider/provider.dart';
import '../Theme/Theme.dart';
import '../navigation/navigation_rail.dart';
import 'home_screen.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  int _selectedIndex = 1; // Assuming Privacy Policy is at index 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policies'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const ContactForm(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              },
            ),
            Consumer<ThemeNotifier>(
              builder: (context, themeNotifier, child) => ListTile(
                leading: Icon(themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: themeNotifier.isDarkMode,
                  onChanged: (value) {
                    themeNotifier.toggleTheme();
                  },
                ),
              ),
            ),
          ],
        ),
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
                  pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              }
              // Handle other destinations here
              else if (index == 2) {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const ContactForm(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              }
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