// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      status: json['status'] as bool,
      text: json['text'] as String,
      time: json['time'] as String,
      method: json['method'] as String,
      endpoint: json['endpoint'] as String,
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num).toInt(),
      text: json['text'] as String,
      link: json['link'] as String,
      hint: (json['hint'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'text': instance.text,
      'link': instance.link,
      'hint': instance.hint,
    };
