import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final Widget widget;
  final VoidCallback onTap;

  const CustomTile({super.key, required this.widget, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: widget);
  }
}
