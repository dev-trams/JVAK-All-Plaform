import 'package:flutter/material.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'package:jvak/widgets/setting_title_bar.dart';
import 'package:jvak/widgets/widget_core_appbar.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoreAppBar().crateCoreAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SettingTitleBar(title: '개인정보처리방침'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: JvakThemeData.backgroundColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    chapterText(title: true, text: '정보 수집 및 이용 목적'),
                    heightBox(),
                    chapterText(subTitle: true, text: '1. 회원가입 및 로그인 처리'),
                    heightBox(),
                    chapterText(subTitle: false, text: '''
회원 가입 시 구글 간편로그인을 통해 사용자의 이메일, 암호화된 ID, 이름, 프로필 이미지를 수집합니다.
이메일, 이름, 프로필 이미지는 앱의 프로필 기능에서 사용되며, 사용자의 프로필 정보를 표시하는 용도로 활용됩니다.
            '''),
                    chapterText(subTitle: true, text: '2. 회원가입 및 로그인 처리'),
                    heightBox(),
                    chapterText(subTitle: false, text: '''
사용자의 암호화된 ID는 즐겨찾기 기능을 구현하기 위해 사용됩니다.
북마크된 콘텐츠를 식별하고 사용자에게 맞춤형 서비스를 제공하기 위해 암호화된 ID를 활용합니다.
            '''),
                    chapterText(subTitle: true, text: '3. 회원가입 및 로그인 처리'),
                    heightBox(),
                    chapterText(subTitle: false, text: '''
수집한 개인정보는 적절한 보호 및 보안 조치를 취하여 안전하게 관리됩니다.
개인정보는 암호화 되어 저장되며, 불법적인 엑세스, 변경, 유출, 파기 등을 방지하기 위해 기술적, 물리적, 관리적인 보안 조치를 적용합니다.
            
            '''),
                    chapterText(subTitle: true, text: '4. 회원가입 및 로그인 처리'),
                    heightBox(),
                    chapterText(subTitle: false, text: '''
수집한 개인정보는 본 개인정보 처리방침에서 명시한 목적 이외의 용도로 제3자에게 제공되지 않스빈다.
            
다만, 법령에 의거하여 국가 기관 등의 요청이 있는 경우에는 관련 법령에 따라 제공될 수 있습니다.
            '''),
                    chapterText(subTitle: true, text: '5. 회원가입 및 로그인 처리'),
                    heightBox(),
                    chapterText(subTitle: false, text: '''
수집한 개인정보는 서버에 안전하게 저장됩니다.
            
개인정보는 수집 및 이용 목적이 달성된 후에는 즉시 파기됩니다.
            
다만, 관련 법령에 따라 일정 기간 동안 보관할 필요가 있는 경우에는 해당 법령의 규정에 따라 보관하며, 이후에는 안전하게 파기 됩니다.
            '''),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SizedBox heightBox() {
  return const SizedBox(
    height: 20,
  );
}

SizedBox chapterText({
  bool? title = false,
  bool? subTitle = false,
  required String text,
}) {
  return SizedBox(
    width: double.infinity,
    child: Text(
      text,
      style: TextStyle(
        color: title! ? Colors.grey : Colors.black,
        fontSize: title
            ? 20
            : subTitle!
                ? 18
                : 12,
      ),
    ),
  );
}
