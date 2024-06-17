import 'package:flutter/material.dart';
import 'package:marshmallow_website/screens/details.dart';
import 'package:marshmallow_website/screens/privacy_policy.dart';
import 'package:provider/provider.dart';
import 'Theme/Theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            theme: notifier.lightTheme,
            darkTheme: notifier.darkTheme,
            themeMode: notifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/privacy_policy': (context) => PrivacyPolicy(),
              '/HealthComposePrivacyPolicyDetails' : (context) => DetailsScreen(),
            },
          );
        },
      ),
    );
  }
}