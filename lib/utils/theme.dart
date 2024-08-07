import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    // Define los colores personalizados aquí
    return ThemeData(
      primaryColor: Colors.blue, // Puedes cambiarlo por el color deseado
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue, // Color de la AppBar
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Color de fondo de los botones
          foregroundColor: Colors.white, // Color del texto en los botones
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(color: Colors.black, fontSize: 36.0),
        titleLarge: TextStyle(color: Colors.black, fontSize: 20.0),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
