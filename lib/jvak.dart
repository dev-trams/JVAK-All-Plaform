class JvakModel {
  /// 노래 JSON 집합
  String sid = '',
      scode = '',
      title = '',
      singer = '',
      aniTitle = '',
      aniCategory = '',
      aniStage = '',
      number = '';

  /// 노래 JSON 데이터 조립기
  JvakModel.fromJson(Map<String, dynamic> json)
      : sid = json['sid'],
        scode = json['scode'],
        title = json['title'],
        singer = json['singer'],
        aniTitle = json['ani_title'],
        aniCategory = json['ani_category'],
        aniStage = json['ani_stage'],
        number = json['song_number'];

  /// 공지 JSON 집합
  String num = '', uptime = '', header = '', comment = '';

  /// 공지 JSON 데이터 조립기
  JvakModel.fromNotice(Map<String, dynamic> json)
      : num = json['num'],
        header = json['header'],
        comment = json['comment'],
        uptime = json['uptime'];
}
