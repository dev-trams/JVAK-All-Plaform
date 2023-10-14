import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: const BoxDecoration(),
        child: Center(
          child: value
              ? const Icon(
                  Icons.star_rounded,
                  size: 30.0,
                  color: Color(0xFFFF9393),
                )
              : const Icon(
                  Icons.star_border_rounded,
                  size: 30.0,
                  color: Color(0xFFFFBEBE),
                ),
        ),
      ),
    );
  }
}
