// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: json['id'] as String,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      email: json['email'] as String,
      phoneno: json['phoneno'],
      wallet: json['wallet'] as String,
      status: (json['status'] as num).toInt(),
      loginPin: json['login_pin'] as String,
      transPin: json['trans_pin'] as String,
      verifiedEmail: (json['verified_email'] as num).toInt(),
      lastTimeApiCalled: json['last_time_api_called'] as String,
      accountDeleted: (json['account_deleted'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'email': instance.email,
      'phoneno': instance.phoneno,
      'wallet': instance.wallet,
      'status': instance.status,
      'login_pin': instance.loginPin,
      'trans_pin': instance.transPin,
      'verified_email': instance.verifiedEmail,
      'last_time_api_called': instance.lastTimeApiCalled,
      'account_deleted': instance.accountDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
