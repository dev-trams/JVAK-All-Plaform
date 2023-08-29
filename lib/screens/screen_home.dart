import 'package:flutter/material.dart';
import 'package:jvak/models/jvak.dart';
import 'package:jvak/services/api_service.dart';
import 'package:jvak/services/jvak_api_service.dart';
import '../utils/jvak_theme_data.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  Future<List<JvakModel>> jvakData = JvakApiService().getJvak();
  Future<List<JvakModel>> testData = ApiService().getTest();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("JVAK"),
          backgroundColor: JvakThemeData.loadingBottomBarColor,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: FutureBuilder(
            future: jvakData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var musicList = snapshot.data![index];
                    return Text(
                        '${musicList.title} | ${musicList.singer} | ${musicList.number}');
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}


/*
return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var musicList = snapshot.data![index];
                    return Text(musicList.title);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                );
*/