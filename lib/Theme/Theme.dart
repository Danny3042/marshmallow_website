import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get lightTheme => ThemeData.light();
  ThemeData get darkTheme => ThemeData.dark();


  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

