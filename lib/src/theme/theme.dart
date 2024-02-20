import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade100,
      colorScheme: const ColorScheme.light().copyWith(
        secondary: Colors.grey.shade300,
      ));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme:
          const ColorScheme.dark().copyWith(secondary: Colors.black38));
}
