import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  @JsonKey(name: "status")
  bool status;
  @JsonKey(name: "text")
  String text;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "method")
  String method;
  @JsonKey(name: "endpoint")
  String endpoint;

  ResponseModel({
    required this.status,
    required this.text,
    required this.time,
    required this.method,
    required this.endpoint,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "code")
  int code;
  @JsonKey(name: "text")
  String text;
  @JsonKey(name: "link")
  String link;
  @JsonKey(name: "hint")
  List<String> hint;

  Error({
    required this.code,
    required this.text,
    required this.link,
    required this.hint,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
