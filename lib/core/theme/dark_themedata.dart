import 'package:flutter/material.dart';

class DartTheme {
  Color dark = const Color(0XFF16213E);
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: const Color(0XFF16213E),
      backgroundColor: const Color(0XFF16213E),
      indicatorColor: const Color(0XFF16213E),
      hintColor: const Color(0XFF16213E),
      highlightColor: const Color(0XFF16213E),
      hoverColor: const Color(0XFF16213E),
      focusColor: const Color(0XFF16213E),
      disabledColor: const Color(0XFF16213E),
      cardColor: const Color(0XFF16213E),
      canvasColor: const Color(0XFF16213E),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0XFF16213E),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
    );
  }
}
