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

  static const appBarBackgroundColor = Colors.white;
  static const logoTextColor = Color(0xFFFF4848);
  static const backgroundColor = Color(0xFFFFD9D9);
  static const loadingBottomBarColor = Color(0xFFFF9393);
  static const songTextColor = Color(0xFFFF7B7B);
}
