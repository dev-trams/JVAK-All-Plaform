import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jvak/utils/jvak_theme_data.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  _BookMarkScreenState createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 탭 수에 맞게 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_left,
            color: JvakThemeData.songTextColor,
            size: 45,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          controller: _tabController, // TabController 연결
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
        title: Text(
          "JVAK",
          style: GoogleFonts.passionOne(
              color: JvakThemeData.logoTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        backgroundColor: JvakThemeData.appBarBackgroundColor,
      ),
      body: TabBarView(
        controller: _tabController, // TabController 연결
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const Text('data1'),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const Text('data2'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController 해제
    super.dispose();
  }
}
