import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jvak/models/bookmark.dart';
import 'package:jvak/models/new_jvak.dart';
import 'package:jvak/provider/pv_boomark.dart';
import 'package:jvak/services/jvak_api_service.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'package:jvak/widgets/banner_ads.dart';
import 'package:jvak/widgets/custom_tile.dart';
import 'package:jvak/widgets/custom_toggle_button_view.dart';
import 'package:jvak/widgets/music_list_item.dart';
import 'package:jvak/widgets/text_alert_dialog.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListScreen extends StatefulWidget {
  ListScreen({
    super.key,
    required this.jvakData,
    required this.scode,
  });
  String scode;
  Future<List<NewJvakModule>> jvakData;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _jvakApiService = JvakApiService();
  SongFilter menuItem = SongFilter.song;
  bool chartState = false;
  String keywordVal = '';

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<SongFilter>> songEntries =
        <DropdownMenuItem<SongFilter>>[];
    for (final SongFilter songFilter in SongFilter.values) {
      songEntries.add(
        DropdownMenuItem(
          value: songFilter,
          child: Text(songFilter.text),
        ),
      );
    }

    JvakApiService jvakApiService = JvakApiService();
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 0, 10),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        elevation: 8,
                        value: menuItem,
                        onChanged: (value) {
                          menuItem = value!;
                          setState(() {});
                        },
                        style: const TextStyle(
                          fontSize: 18,
                          color: JvakThemeData.songTextColor,
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: JvakThemeData.songTextColor,
                            size: 30,
                          ),
                        ),
                        underline: const SizedBox(),
                        items: songEntries,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: TextField(
                  cursorColor: JvakThemeData.loadingBottomBarColor,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: JvakThemeData.songTextColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: JvakThemeData.logoTextColor),
                    ),
                  ),
                  style: const TextStyle(),
                  onChanged: (value) {
                    debugPrint('list_log: $value');
                    keywordVal = value;
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 0,
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        widget.jvakData = jvakApiService.getJvak(
                            type: 'search',
                            scode: widget.scode,
                            title: keywordVal,
                            keyword: menuItem.code);
                      },
                    );
                  },
                  icon: const Icon(Icons.search),
                  iconSize: 35,
                  color: JvakThemeData.songTextColor,
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: CustomToggleBtnView(
            leftDescription: '전체차트',
            rightDescription: '인기차트',
            firstView: listView(widget.jvakData),
            secondView: listView(
                _jvakApiService.getJvak(scode: widget.scode, type: 'release')),
          ),
        ),
        SizedBox(
          height: AdSize.banner.height.toDouble(),
          child: const BannerExam(),
        )
      ],
    );
  }

  FutureBuilder<List<NewJvakModule>> listView(
      Future<List<NewJvakModule>>? jvakData) {
    return FutureBuilder(
      future: jvakData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Consumer<BookMarkProvider>(builder: (context, value, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // (index + 1) % 9 == 0
                if (false) {
                  return Container(
                    height: 55, // 광고의 높이를 조절해주세요.
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const BannerExam(),
                  );
                } else {
                  var musicList = snapshot.data![index];
                  // `value.bookmarks`가 비어 있을 수 있으므로 먼저 길이를 확인합니다.
                  final bookmarkExists = index < value.bookmarks.length &&
                      value.bookmarks[index] != -1;
                  final bookmark = bookmarkExists
                      ? value.bookmarks[index]
                      : BookMark(
                          id: musicList.no,
                          brand: widget.scode,
                          checked: false);
                  return CustomTile(
                    widget: Column(
                      children: [
                        musicListItem(
                          musicList: musicList,
                          checked: (value.bookmarks.indexWhere((element) =>
                                      (element.id == musicList.no) &&
                                      (element.brand == widget.scode)) !=
                                  -1
                              ? value.bookmarks
                                  .where((element) =>
                                      (element.id == musicList.no) &&
                                      (element.brand == widget.scode))
                                  .first
                                  .checked
                              : false),
                          onChanged: (checked) => value.changeBookmarkChecked(
                            context: context,
                            id: bookmark.id,
                            brand: bookmark.brand,
                            checked: bookmark.checked,
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: JvakThemeData.backgroundColor,
                        ),
                      ],
                    ),
                    onTap: () {
                      TextAlertDialog(
                        title: 'music',
                        text: musicList.no,
                        text1: musicList.title,
                        text2: musicList.singer,
                        text3: musicList.composer,
                        text4: musicList.lyricist,
                        text5: '',
                      ).songPopup(context: context);
                    },
                  );
                }
              },
            );
          });
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
    );
  }
}

enum SongFilter {
  song('제목', 'song'),
  singer('가수', 'singer');

  const SongFilter(this.text, this.code);
  final String text;
  final String code;
}
