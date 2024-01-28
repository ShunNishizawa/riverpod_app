import 'package:flutter/material.dart';

final lightThemeData = ThemeData.from(
  useMaterial3: true,
  colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.green[400],
      onPrimary: Colors.white,
      onSecondary: Colors.black),
  textTheme: const TextTheme(),
).copyWith(
    scaffoldBackgroundColor: Colors.yellow,
    appBarTheme: AppBarTheme(color: Colors.pink));

final darkThemeData = ThemeData.from(
        useMaterial3: true,
        colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.red[600],
            onPrimary: Colors.yellow,
            onSecondary: Colors.black),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.green),
          headlineMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ))
    .copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.blue[100]));
