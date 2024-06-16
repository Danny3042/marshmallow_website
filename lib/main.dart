import 'package:flutter/material.dart';
import 'screens/privacy_policy.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marshmallow website',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
          onThemeChanged: (value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
        '/privacy_policy': (context) => PrivacyPolicy(),
      },
    );
  }
}

