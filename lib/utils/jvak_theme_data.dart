import 'package:flutter/material.dart';

class JvakThemeData {
  static ThemeData lightThemeData = ThemeData();

  static ThemeData themeData() {
    final base = ThemeData.light();
    return base.copyWith(
      textTheme: _buildJvakTextTheme(base.textTheme),
    );
  }

  static TextTheme _buildJvakTextTheme(TextTheme base) {
    return base.copyWith();
  }

  static const backgroundColor = Color(0xFFFFD9D9);
  static const loadingBottomBarColor = Color(0xFFFF9393);
}
