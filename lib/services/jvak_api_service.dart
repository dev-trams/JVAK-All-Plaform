// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jvak/models/new_jvak.dart';

class JvakApiService {
  final String baseUrl = "https://api.manana.kr";
  final String karaoke = "karaoke";
  final String song = "song";
  final String scode = 'kumyoung';
  final String release = "release";
  final String kumyoung = "kumyoung";
  final String tj = "tj";
  final String extension = "json";
  Future<List<NewJvakModule>> getJvak(
      {String? type,
      String? scode,
      String? state,
      String? keyword,
      String? title}) async {
    //!Default URL
    final coreUrl = Uri.parse('$baseUrl/$karaoke/song/A/$scode.$extension');
    //!Search URL
    final searchTitleUrl =
        Uri.parse('$baseUrl/$karaoke/$keyword/$title/$scode.$extension');
    debugPrint('$searchTitleUrl');
    final releaseUrl =
        Uri.parse('$baseUrl/$karaoke/popular/$scode/monthly.$extension');
    // Future 타입은 당장 실행되는 타입이 아닌 미래에 실행되는 타입이다.
    // Future 는 await와 같이 사용 할 수 있고 await를 사용하려면 그 함수는 async 함수여야 한다.
    final http.Response response;
    debugPrint('$type | $title');
    if (type == 'search') {
      if (title!.isEmpty) {
        response = await http.get(coreUrl);
      } else {
        response = await http.get(searchTitleUrl);
      }
    } else if (type == 'release') {
      response = await http.get(releaseUrl);
    } else {
      response = await http.get(coreUrl);
    }

    if (response.statusCode == 200) {
      print('접속 성공 : 200');
      List<Map<String, dynamic>> responseData =
          List<Map<String, dynamic>>.from(json.decode(response.body));
      List<NewJvakModule> coreClients =
          responseData.map((data) => NewJvakModule.fromJson(data)).toList();
      return coreClients;
    } else {
      print('err');
    }
    throw Exception('error not connection Api${response.body}');
  }
}
