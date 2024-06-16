import 'package:flutter/material.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'package:jvak/widgets/custom_toggle_button.dart';

class CustomToggleBtnView extends StatefulWidget {
  final String leftDescription, rightDescription;
  final Widget firstView, secondView;
  final Color? toggleBackgroundColor;
  final Color? toggleBorderColor;
  final Color? toggleColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;
  const CustomToggleBtnView({
    super.key,
    required this.leftDescription,
    required this.rightDescription,
    required this.firstView,
    required this.secondView,
    this.toggleBackgroundColor,
    this.toggleBorderColor,
    this.toggleColor,
    this.activeTextColor,
    this.inactiveTextColor,
  });

  @override
  State<CustomToggleBtnView> createState() => _CustomToggleBtnViewState();
}

class _CustomToggleBtnViewState extends State<CustomToggleBtnView> {
  bool toggleState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ToggleButton(
                width: 300,
                height: 50,
                toggleBackgroundColor:
                    widget.toggleBackgroundColor ?? Colors.transparent,
                toggleBorderColor: widget.toggleBorderColor ?? Colors.grey,
                toggleColor:
                    widget.toggleColor ?? JvakThemeData.loadingBottomBarColor,
                activeTextColor:
                    widget.activeTextColor ?? JvakThemeData.songTextColor,
                inactiveTextColor: widget.inactiveTextColor ?? Colors.grey,
                leftDescription: widget.leftDescription,
                rightDescription: widget.rightDescription,
                onLeftToggleActive: () => setState(() {
                  toggleState = true;
                }),
                onRightToggleActive: () => setState(() {
                  toggleState = false;
                }),
              ),
            ),
          ),
        ),
        // toggleState에 따라 다른 내용 표시
        if (!toggleState)
          Expanded(
            child: widget.firstView,
          )
        else
          Expanded(
            child: widget.secondView,
          )
      ],
    );
  }
}
