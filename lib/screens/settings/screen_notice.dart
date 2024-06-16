import 'package:flutter/material.dart';
import 'package:jvak/services/jvak_api_service.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'package:jvak/widgets/custom_tile.dart';
import 'package:jvak/widgets/setting_title_bar.dart';
import 'package:jvak/widgets/widget_core_appbar.dart';

class NoticeScreen extends StatefulWidget {
  NoticeScreen({super.key});
  final jvakData = JvakApiService().getJvak(type: 'notice');

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoreAppBar(
        closeButtonType: false,
      ).crateCoreAppBar(context),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const SettingTitleBar(
              title: '공지사항',
            ),
            FutureBuilder(
              future: widget.jvakData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return CustomTile(
                          widget: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: JvakThemeData.backgroundColor,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        child: Text(
                                          // noticeList.header,
                                          '',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          // noticeList.uptime
                                          ''
                                              .split(' ')
                                              .first
                                              .replaceAll('-', '.'),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const SizedBox(
                                    child: Text(
                                        // noticeList.comment
                                        ''),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {},
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text(
                        '등록된 공지사항이 없습니다.',
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: JvakThemeData.loadingBottomBarColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(snapshot.hasData ? '로딩중...' : '데이터가 없습니다.')
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
