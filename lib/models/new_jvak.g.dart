// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_jvak.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewJvakModule _$NewJvakModuleFromJson(Map<String, dynamic> json) =>
    NewJvakModule(
      brand: json['brand'] as String,
      no: json['no'] as String,
      title: json['title'] as String,
      singer: json['singer'] as String,
      composer: json['composer'] as String,
      lyricist: json['lyricist'] as String,
      release: json['release'] as String,
    );

Map<String, dynamic> _$NewJvakModuleToJson(NewJvakModule instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'no': instance.no,
      'title': instance.title,
      'singer': instance.singer,
      'composer': instance.composer,
      'lyricist': instance.lyricist,
      'release': instance.release,
    };
