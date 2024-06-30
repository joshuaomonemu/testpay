import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class UserModel {
  @HiveField(1)
  @JsonKey(name: "email")
  String? email;
  @HiveField(2)
  @JsonKey(name: "login_pin")
  String? password;
  @HiveField(3)
  @JsonKey(name: "token")
  String token;
  @HiveField(4)
  @JsonKey(name: 'emailVerified')
  bool? emailVerified;

  UserModel({
    this.email,
    this.password,
    this.emailVerified,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
