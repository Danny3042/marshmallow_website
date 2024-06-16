import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marshmallow website',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // This is the default route of the application.
      routes: {
        '/': (context) => HomeScreen(), // This is the home route.
        '/home': (context) => HomeScreen(), // This is an additional route for the same screen.
        // Add more routes as needed.
      },
    );
  }
}
