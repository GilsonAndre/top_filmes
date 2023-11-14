import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeLight() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.deepOrange,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Colors.deepOrange,
      ),
      // scaffoldBackgroundColor: const Color(0xFF1B1B1B),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

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
        bodyMedium: TextStyle( color: Colors.white),
        headlineSmall: TextStyle( color: Colors.white),
      ),
    );
  }
}
