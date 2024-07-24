import 'package:flutter/material.dart';
import 'package:marshmallow_website/screens/privacy_policy.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;
import '../Theme/Theme.dart';
import '../navigation/navigation_rail.dart';
import 'home_screen.dart'; // Update this path as necessary

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  int _selectedIndex = 2; // Assuming the contact form is at index 1
  final String _iframeElementId = 'contact-form-iframe';

  @override
  void initState() {
    super.initState();
    // Register the view factory
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      _iframeElementId,
          (int viewId) => html.IFrameElement()
        ..src = 'https://forms.gle/hS12dNpx23VNrGLq6'
        ..style.border = 'none'
        ..width = '100%'
        ..height = '100%',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                  const HomeScreen(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ),
                );

                ListTile(
                    leading: const Icon(Icons.privacy_tip),
                    title: const Text('Privacy Policy'),
                    onTap: () {
                      Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                        const PrivacyPolicy(),
                        transitionsBuilder: (context, animation1, animation2, child) {
                          return FadeTransition(opacity: animation1, child: child);
                        },
                      ),
                      );

                    }
                );
                ListTile(
                  leading: const Icon(Icons.contacts),
                  title: const Text('Contact Us'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );

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
              // Implement navigation logic based on 'index' here
              if (index == 0) {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              }
              else if (index == 1) {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const PrivacyPolicy(),
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
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: HtmlElementView(viewType: _iframeElementId),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}