import 'package:flutter/material.dart';
import 'package:jvak/models/jvak.dart';
import 'package:jvak/services/jvak_api_service.dart';
import 'package:jvak/utils/jvak_theme_data.dart';
import 'package:jvak/widgets/custom_tile.dart';
import 'package:jvak/widgets/music_list_item.dart';
import 'package:jvak/widgets/text_alert_dialog.dart';
import 'package:jvak/widgets/custom_pub/ctoggle_switch.dart';

// ignore: must_be_immutable
class ListScreen extends StatefulWidget {
  ListScreen({
    super.key,
    required this.jvakData,
    required this.scode,
  });
  String scode;
  Future<List<JvakModel>> jvakData;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
                          state: menuItem.code,
                          keyword: keywordVal,
                        );
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
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ToggleSwitch(
              minWidth: double.infinity,
              cornerRadius: 17.0,
              activeBorders: [
                Border.all(
                  color: JvakThemeData.songTextColor,
                  width: 3,
                )
              ],
              activeBgColors: const [
                [Colors.white],
                [Colors.white]
              ],
              mainBorderColor: Colors.grey,
              activeFgColor: JvakThemeData.songTextColor,
              inactiveBgColor: Colors.transparent,
              inactiveFgColor: JvakThemeData.songTextColor,
              activeBgColor: const [Colors.white],
              fontSize: 18,
              initialLabelIndex: 0,
              totalSwitches: 2,
              borderWidth: 0,
              labels: const ['전체차트', '인기차트'],
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: FutureBuilder(
              future: widget.jvakData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var musicList = snapshot.data![index];
                      return CustomTile(
                        widget: Column(
                          children: [
                            musicListItem(
                              musicList: musicList,
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
                            text: musicList.number,
                            text1: musicList.title,
                            text2: musicList.singer,
                            text3: musicList.aniTitle,
                            text4: musicList.aniStage,
                            text5: musicList.aniCategory,
                          ).SongPopup(context: context);
                        },
                      );
                    },
                  );
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
          ),
        ),
      ],
    );
  }
}

enum SongFilter {
  song('제목', 'title'),
  singer('가수', 'singer'),
  ani('애니', 'ani_title');

  const SongFilter(this.text, this.code);
  final String text;
  final String code;
}
