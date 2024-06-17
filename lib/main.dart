import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marshmallow_website/screens/details.dart';
import 'screens/privacy_policy.dart';
import 'screens/home_screen.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Marshmallow website',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
          onThemeChanged: (value) {
            themeNotifier.toggleTheme();
          },
        ),
        '/privacy_policy': (context) => PrivacyPolicy(),
        '/HealthComposePrivacyPolicyDetails' : (context) => DetailsScreen(),
      },
    );
  }
}