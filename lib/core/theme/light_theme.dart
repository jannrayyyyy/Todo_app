import 'package:flutter/material.dart';

class LightTheme {
  Color dark = const Color(0XFF16213E);
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      disabledColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
    );
  }
}
