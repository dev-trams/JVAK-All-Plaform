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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: TabBar(
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
                    IconButton(
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
                    ),
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
                jvakData: jvakData.getJvak(scode: 'ky', type: 'all'),
                scode: 'ky',
              ),
              ListScreen(
                jvakData: jvakData.getJvak(scode: 'tj', type: 'all'),
                scode: 'tj',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
