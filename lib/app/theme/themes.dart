import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      elevation: 1.0,
      shadowColor: Colors.black,
      color: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: const ColorScheme.light(
        primary: Colors.white,
        onPrimary: Colors.white,
        secondary: Colors.white),
    cardTheme: const CardTheme(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20.0),
        titleSmall: TextStyle(color: Colors.white, fontSize: 15.0)),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      elevation: 1.0,
      shadowColor: Colors.white,
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      titleSmall: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );
}
