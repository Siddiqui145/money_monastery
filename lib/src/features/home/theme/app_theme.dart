import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 22, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
      bodySmall: TextStyle(fontSize: 14, color: Colors.black87),

    titleLarge: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
  ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black87,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
  
}