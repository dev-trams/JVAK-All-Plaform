import 'package:flutter/material.dart';
import 'package:jvak/screens/settings/screen_inquiry_and_request.dart';
import 'package:jvak/screens/settings/screen_notice.dart';
import 'package:jvak/screens/settings/screen_policy.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'package:jvak/widgets/banner_ads.dart';
import 'package:jvak/widgets/widget_core_appbar.dart';

class SettingCoreScreen extends StatelessWidget {
  const SettingCoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoreAppBar().crateCoreAppBar(context),
      body: Column(
        children: [
          // WidgetSettingBar(title: '관리'),
          // WidgetSettingButton(
          //     title: '구글 로그인',
          //     onPressed: () => goScreen(context, const BannerExam())),
          WidgetSettingBar(title: '소식'),
          WidgetSettingVersionButton(),
          WidgetSettingBar(title: '고객센터'),
          // WidgetSettingButton(title: 'JVAK 사용법'),
          // const Divider(color: JvakThemeData.logoTextColor),
          WidgetSettingButton(
              title: '공지사항',
              onPressed: () => goScreen(context, NoticeScreen())),
          const Divider(color: JvakThemeData.logoTextColor),
          WidgetSettingButton(
              title: '개인정보처리방침',
              onPressed: () => goScreen(context, const PolicyScreen())),
          const Divider(color: JvakThemeData.logoTextColor),
          WidgetSettingButton(
            title: '문의 및 신청',
            onPressed: () => goScreen(context, const InquiryAndRequestScreen()),
          ),
          const Divider(color: JvakThemeData.logoTextColor),
        ],
      ),
    );
  }

  TextButton WidgetSettingVersionButton({Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed ?? () => print('clicked'),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '현재 버전 2.0.1',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              '최신버전',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton WidgetSettingButton(
      {required String title, Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed ?? () => print('clicked'),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container WidgetSettingBar({required String title}) {
    return Container(
      width: double.infinity,
      height: 25,
      decoration: const BoxDecoration(
        color: JvakThemeData.backgroundColor,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: JvakThemeData.logoTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

void goScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => screen,
    ),
  );
}
