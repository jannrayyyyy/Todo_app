import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
      hoverColor: Colors.purple.shade200,
      focusColor: Colors.purple.shade200,
      disabledColor: Colors.purple.shade200,
      brightness: Brightness.light,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purple.shade200),
      dialogBackgroundColor: Colors.white,
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
