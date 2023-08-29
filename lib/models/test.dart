class Test {
  final String title;
  final String artist;
  Test.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        artist = json['artist'];
}
