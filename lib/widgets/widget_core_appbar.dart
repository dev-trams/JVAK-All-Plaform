import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jvak/utils/jvak_theme_data.dart';

class CoreAppBar {
  final bool? closeButtonType;
  CoreAppBar({this.closeButtonType = false});

  AppBar crateCoreAppBar(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: JvakThemeData.appBarBackgroundColor,
      title: Text(
        'JVAK',
        style: GoogleFonts.passionOne(
          color: JvakThemeData.logoTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          closeButtonType! ? Icons.close : Icons.arrow_left,
          size: 40,
          color: JvakThemeData.songTextColor,
        ),
      ),
    );
  }
}
