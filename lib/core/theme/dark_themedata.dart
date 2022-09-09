import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0XFF121212),
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0XFF121212)),
      backgroundColor: const Color(0XFF121212),
      hoverColor: Colors.purple.shade200,
      focusColor: Colors.purple.shade200,
      disabledColor: Colors.purple.shade200,
      brightness: Brightness.dark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple.shade200),
      dialogBackgroundColor: Colors.grey.shade900,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade200,
          textStyle: const TextStyle(color: Colors.black),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.purple.shade200),
        elevation: 0,
      ),
      iconTheme: IconThemeData(color: Colors.purple.shade200),
    );
  }
}
