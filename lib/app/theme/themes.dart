import 'package:flutter/material.dart';
import 'package:khata_app/app/constants/colors.dart';

class AppThemes {
  AppThemes._();

  ///Light Theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: AppColors.black),
      elevation: 1.0,
      shadowColor: AppColors.black,
      color: AppColors.white,
      titleTextStyle: TextStyle(color: AppColors.black),
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    cardTheme: CardTheme(color: AppColors.white),
    iconTheme: IconThemeData(color: AppColors.black),
    textTheme: TextTheme(
        titleLarge: TextStyle(color: AppColors.white, fontSize: 20.0),
        titleSmall: TextStyle(color: AppColors.white, fontSize: 15.0)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => AppColors.black),
      ),
    ),
  );

  /// Dark Theme ///
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: AppColors.white),
        elevation: 1.0,
        shadowColor: AppColors.white,
        color: Colors.black,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white54,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 20.0,
        ),
        titleSmall: TextStyle(
          color: Colors.white70,
          fontSize: 18.0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => AppColors.white),
        ),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: AppColors.grey));
}
