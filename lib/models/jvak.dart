class JvakModel {
  final String sid,
      scode,
      title,
      singer,
      aniTitle,
      aniCategory,
      aniStage,
      number;
  JvakModel.fromJson(Map<String, dynamic> json)
      : sid = json['sid'],
        scode = json['scode'],
        title = json['title'],
        singer = json['singer'],
        aniTitle = json['ani_title'],
        aniCategory = json['ani_category'],
        aniStage = json['ani_stage'],
        number = json['song_number'];
}
