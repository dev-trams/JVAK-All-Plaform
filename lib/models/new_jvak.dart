import 'package:json_annotation/json_annotation.dart';

part 'new_jvak.g.dart';

@JsonSerializable()
class NewJvakModule {
  final String brand;
  final String no;
  final String title;
  final String singer;
  final String composer;
  final String lyricist;
  final String release;

  NewJvakModule(
      {required this.brand,
      required this.no,
      required this.title,
      required this.singer,
      required this.composer,
      required this.lyricist,
      required this.release});

  factory NewJvakModule.fromJson(Map<String, dynamic> json) =>
      _$NewJvakModuleFromJson(json);
  Map<String, dynamic> toJson() => _$NewJvakModuleToJson(this);
}
