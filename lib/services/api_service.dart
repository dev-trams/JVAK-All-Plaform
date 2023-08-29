import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jvak/models/jvak.dart';
import 'package:jvak/models/test.dart';

class ApiService {
  final String baseUrl =
      "https://script.googleusercontent.com/macros/echo?user_content_key=1NV5eh4wCwHkHKtanr9_oBivlU08hqy8YQJ8MTzyafUNZUunxY1CqVfWdNaDNI33Ey_eNiFupeMFTyL8tAEc8tGcKmQUP5oBm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnLwnE2uFGvghCWMSHaRWSPjgrEWDjIY1E9jRNu0Qyutmyv67NbvuDu4BrYRttmstuz5vCjkAqOf6xA9nBBChPslKNrm61wuV-tz9Jw9Md8uu&lib=MhZMQyD35IJHmBlt2kAk8HzH52fW3LjiK";

  Future<List<JvakModel>> getTest() async {
    List<JvakModel> jvakInstances = [];
    final coreUrl = Uri.parse(baseUrl);
    /* final searchUrl = Uri.parse(
        '$baseUrl?mode=$modeKey&scode=$scodeKey&state=$stateKey&keyword=$keywordKey');*/
    final response = await http.get(coreUrl, headers: <String, String>{
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> testData = jsonDecode(response.body);
      print(testData);
      final List<dynamic> testApi = testData['GoogleSheetData'];

      for (var song in testApi) {
        jvakInstances.add(JvakModel.fromJson(song));
      }
      return jvakInstances;
    }
    throw Error();
  }
}
