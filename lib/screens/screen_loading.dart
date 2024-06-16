import 'package:flutter/material.dart';

class ScreenLoading extends StatelessWidget {
  const ScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Image(
        image: AssetImage("assets/img_loading.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}
