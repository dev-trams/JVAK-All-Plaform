import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jvak/models/jvak.dart';

class JvakApiService {
  final String baseUrl = "https://jvak.ctrls-studio.com/admin/process/json";
  final String scodeKey = "ky";
  final String stateKey = "singer";
  final String keywordKey = "하츠";
  final String modeKey = "music";

  Future<List<JvakModel>> getJvak({
    required String type,
    required String scode,
    String? state,
    String? keyword,
  }) async {
    List<JvakModel> jvakInstances = [];
    final coreUrl = Uri.parse('$baseUrl?mode=$modeKey&scode=$scode');

    final searchUrl = Uri.parse(
        '$baseUrl?mode=$modeKey&scode=$scode&state=$state&keyword=$keyword');
    final Map<String, String> cokieData = {'Cookie': 'grant=app'};

    // Future 타입은 당장 실행되는 타입이 아닌 미래에 실행되는 타입이다.
    // Future 는 await와 같이 사용 할 수 있고 await를 사용하려면 그 함수는 async 함수여야 한다.
    final response = await http.get(type == 'all' ? coreUrl : searchUrl,
        headers: <String, String>{
          'Content-Type': 'application/json',
          ...cokieData
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jvakData = jsonDecode(response.body);
      final List<dynamic> jvak = jvakData['jvak'];

      for (var song in jvak) {
        jvakInstances.add(JvakModel.fromJson(song));
      }
      return jvakInstances;
    } else {
      print(
          'error[jvapApiService - response error] \nresponseCode = ${response.statusCode}');
    }
    throw Error();
  }
}
