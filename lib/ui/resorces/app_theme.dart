import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeDark() {
    return ThemeData(
      primaryColor: Colors.deepOrange,
      appBarTheme: const AppBarTheme(
        color: Colors.deepOrange,
      ),
      tabBarTheme: const TabBarTheme(
        indicator: BoxDecoration(
          color: Colors.deepOrange,
        )
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 46, 46, 46),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
        headlineSmall: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
