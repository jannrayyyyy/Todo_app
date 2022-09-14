import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0XFF121212),
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0XFF121212)),
      backgroundColor: const Color(0XFF121212),
      hoverColor: Colors.blue,
      disabledColor: Colors.blue,
      brightness: Brightness.dark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      dialogBackgroundColor: Colors.grey.shade900,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        elevation: 0,
      ),
      iconTheme: const IconThemeData(
        color: Colors.blue,
      ),
    );
  }
}
