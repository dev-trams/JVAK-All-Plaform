import 'package:flutter/material.dart';
import 'package:jvak/utils/jvak_theme_data.dart';

class SettingTitleBar extends StatelessWidget {
  final String title;
  const SettingTitleBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(color: JvakThemeData.backgroundColor),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: JvakThemeData.songTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
