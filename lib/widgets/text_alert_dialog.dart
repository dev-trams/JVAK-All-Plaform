import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'dart:math' as math;

class TextAlertDialog {
  final String title;
  final String text;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? text6;
  final String? text7;
  final String? text8;
  final String? text9;
  final String? wState;
  final List<Widget>? action;
  final double? fontSize;

  TextAlertDialog({
    required this.title,
    required this.text,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
    this.text7,
    this.text8,
    this.text9,
    this.wState,
    this.fontSize,
    this.action,
  });
  double horizontal = 90 * math.pi / 180;
  Future<dynamic> SongPopup({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Transform.rotate(
          angle: horizontal,
          child: AlertDialog(
            title: null,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            iconPadding: EdgeInsets.zero,
            backgroundColor: JvakThemeData.backgroundColor,
            content: listDefaultLayout(
              songNumber: text,
              title: text1!,
              singer: text2!,
              aniTitle: text3!,
              aniStage: text4!,
              aniCategory: text5!,
            ),
          ),
        );
      },
    );
  }

  SizedBox listDefaultLayoutHorizental() {
    return SizedBox(
      width: 200,
      height: 400,
      child: Column(
        children: [
          SizedBox(
            width: 60,
            height: 400,
            child: Transform.rotate(
              angle: 85,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Column(
                  children: [
                    Text(
                      '123131',
                      style: TextStyle(fontSize: 55),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    );
  }

  SizedBox listDefaultLayout({
    required String songNumber,
    required String title,
    required String singer,
    String? aniTitle,
    String? aniStage,
    String? aniCategory,
  }) {
    return SizedBox(
      width: 400,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                color: JvakThemeData.appBarBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      songNumber,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: JvakThemeData.songTextColor,
                        height: 0.89,
                        fontSize: 62,
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.music_note,
                    size: 50,
                    color: JvakThemeData.backgroundColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: JvakThemeData.songTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                singer,
                style: const TextStyle(
                  fontSize: 14,
                  color: JvakThemeData.songTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                color: JvakThemeData.songTextColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        child: Text(
                      aniTitle ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )),
                    SizedBox(
                      child: Text('${aniCategory ?? ''} ${aniStage ?? ''}',
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showNotificationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: listDefaultLayout(
              songNumber: text,
              title: text1!,
              singer: text2!,
              aniTitle: text3!,
              aniStage: text4!,
              aniCategory: text5!),
          actions: [
            TextButton(
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: fontSize ?? 12,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '확인',
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: fontSize ?? 18,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }

  WorkState state = WorkState.stay;
  Future<dynamic> showAlertDialog1(BuildContext context) {
    print(text7!);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(title),
            content: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  alert1Message('$text1'),
                  alert1Message('$text2'),
                  alert1Message('$text3'),
                  alert1Message('$text4'),
                  alert1Message('$text5'),
                  alert1Message('$text6'),
                  text7 == '변경방법: '
                      ? const SizedBox()
                      : alert1Message('$text7'),
                  alert1Message('$text8'),
                ],
              ),
            ),
            actions: action);
      },
    );
  }

  SizedBox alert1Message(String text) => SizedBox(
        width: 300,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          textAlign: TextAlign.start,
        ),
      );
}

enum WorkState {
  stay('대기', '010'),
  defer('보류', '011'),
  complete('완료', '012');

  const WorkState(this.code, this.state);
  final String code;
  final String state;
}
