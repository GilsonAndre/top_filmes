import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeDark() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.deepOrange,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Colors.deepOrange,
      ),
      scaffoldBackgroundColor: const Color(0xFF1B1B1B),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
        headlineSmall: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
