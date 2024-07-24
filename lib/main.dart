import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow_website/screens/details.dart';
import 'package:marshmallow_website/screens/privacy_policy.dart';
import 'package:provider/provider.dart';
import 'Theme/Theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              '/': (context) => const HomeScreen(),
              '/privacy_policy': (context) => const PrivacyPolicy(),
              '/HealthComposePrivacyPolicyDetails' : (context) => const DetailsScreen(),
            },
          );
        },
      ),
    );
  }
}