import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jvak/screens/body/screen_home.dart';
import 'package:jvak/screens/body/screen_setting_core.dart';
import 'package:jvak/screens/screen_loading.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexed = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        indexed = 1;
      });
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> layouts = [
      const ScreenLoading(),
      const ScreenHome(),
    ];
    return MaterialApp(
      title: 'JVAK',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFD9D9),
        colorScheme: ColorScheme.fromSwatch(),
      ),
      home: layouts[indexed],
    );
  }
}
