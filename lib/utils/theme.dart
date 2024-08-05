import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.orange, // Esto reemplaza a accentColor
      ),
      scaffoldBackgroundColor: Colors.grey[100],
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
