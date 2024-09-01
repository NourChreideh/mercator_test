
import 'package:flutter/material.dart';

class AppTheme {
  
  static ThemeData get theme {
    return ThemeData(
     fontFamily: 'Cairo',
  
      scaffoldBackgroundColor: Colors.black,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(color: Colors.black,titleTextStyle: TextStyle(
        fontFamily:"Cairo",
        color: Colors.white))
    );
  }

  static const TextTheme _textTheme = TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white),
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white),
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
    labelLarge: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.white),
    labelSmall: TextStyle(color: Colors.white),
    
  );
}
