import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jvak/provider/pv_boomark.dart';
import 'package:jvak/screens/body/screen_home.dart';
import 'package:jvak/screens/screen_loading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BookMarkProvider()),
    ],
    child: const MainScreen(),
  ));
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
