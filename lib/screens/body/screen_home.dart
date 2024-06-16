import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jvak/screens/body/screen_list.dart';
import 'package:jvak/screens/body/screen_setting_core.dart';
import 'package:jvak/screens/bookmarks/screen_bookmark.dart';
import 'package:jvak/services/jvak_api_service.dart';
import '../../utils/jvak_theme_data.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final jvakData = JvakApiService();
  int a = 0;
  final devState = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              unselectedLabelColor: Colors.grey,
              indicatorColor: JvakThemeData.songTextColor,
              labelColor: JvakThemeData.songTextColor,
              tabs: [
                Tab(
                  icon: Text(
                    'KY',
                    style: GoogleFonts.passionOne(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Tab(
                  icon: Text(
                    'TJ',
                    style: GoogleFonts.passionOne(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ],
            ),
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingCoreScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: JvakThemeData.songTextColor,
                        size: 35,
                        weight: 400,
                      ),
                    ),
                    Text(
                      "JVAK",
                      style: GoogleFonts.passionOne(
                        color: JvakThemeData.logoTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    devState
                        ? IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => const BookMarkScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.star_border_outlined,
                              color: JvakThemeData.songTextColor,
                              size: 35,
                            ),
                          )
                        : const SizedBox(
                            width: 50,
                          )
                  ],
                ),
                const Divider(
                  color: JvakThemeData.backgroundColor,
                  height: 20,
                ),
              ],
            ),
            backgroundColor: JvakThemeData.appBarBackgroundColor,
          ),
          body: TabBarView(
            children: [
              ListScreen(
                jvakData: jvakData.getJvak(scode: 'kumyoung'),
                scode: 'kumyoung',
              ),
              ListScreen(
                jvakData: jvakData.getJvak(scode: 'tj'),
                scode: 'tj',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
