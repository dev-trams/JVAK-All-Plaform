import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'package:jvak/widgets/custom_toggle_button.dart';
import 'package:jvak/widgets/widget_core_appbar.dart';

class InquiryAndRequestScreen extends StatefulWidget {
  const InquiryAndRequestScreen({super.key});

  @override
  State<InquiryAndRequestScreen> createState() =>
      _InquiryAndRequestScreenState();
}

class _InquiryAndRequestScreenState extends State<InquiryAndRequestScreen> {
  bool toggleState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CoreAppBar().crateCoreAppBar(context),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ToggleButton(
                  width: 300,
                  height: 50,
                  toggleBackgroundColor: Colors.transparent,
                  toggleBorderColor: Colors.grey,
                  toggleColor: JvakThemeData.loadingBottomBarColor,
                  activeTextColor: JvakThemeData.songTextColor,
                  inactiveTextColor: Colors.grey,
                  leftDescription: '신청',
                  rightDescription: '문의',
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
          if (toggleState)
            requestWidget()
          else
            Column(
              children: [
                inquiryWidget(
                  title: '제목',
                  primaryData: true,
                ),
                inquiryWidget(
                  title: '가수',
                  primaryData: true,
                ),
                inquiryWidget(
                  title: '애니메이션',
                ),
                inquiryWidget(
                  title: '파트',
                  partData: true,
                ),
                const SizedBox(height: 50),
                Container(
                  width: 300,
                  decoration: const BoxDecoration(
                      color: JvakThemeData.loadingBottomBarColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: TextButton(
                    onPressed: () => print('clicked!!'),
                    child: const Text(
                      '완료',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }

  Padding inquiryWidget({
    required String title,
    bool? primaryData = false,
    bool? partData = false,
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: inquiryInputBoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextField(
                        cursorColor: JvakThemeData.songTextColor,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          hintText: primaryData!
                              ? '필수 항목입니다.'
                              : partData!
                                  ? 'EX) 1기 1쿨 OP / ED / OST'
                                  : '',
                          hintStyle: const TextStyle(),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: onChanged,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration inquiryInputBoxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      border: Border.all(
        width: 3,
        color: JvakThemeData.songTextColor,
      ),
    );
  }

  XFile? image;
  final ImagePicker picker = ImagePicker();

  Padding requestWidget({Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: JvakThemeData.backgroundColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: '제목',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          onChanged: onChanged,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () => getImage(ImageSource.gallery),
                          child: const Text(
                            '첨부 파일',
                            style: TextStyle(
                              color: JvakThemeData.songTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: TextField(
                      maxLines: 20,
                      maxLength: 300,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      '로그인시 이메일로 문의 답장이 가능합니다.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 250,
            decoration: const BoxDecoration(
              color: JvakThemeData.loadingBottomBarColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: TextButton(
              onPressed: () => print('clicked!!'),
              child: const Text(
                '완료',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        image = XFile(pickedFile.path);
      });
    }
  }
}
