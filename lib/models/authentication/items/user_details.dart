import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
    @JsonKey(name: "id")
    String id;
    @JsonKey(name: "fname")
    String fname;
    @JsonKey(name: "lname")
    String lname;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "phoneno")
    dynamic phoneno;
    @JsonKey(name: "wallet")
    String wallet;
    @JsonKey(name: "status")
    int status;
    @JsonKey(name: "login_pin")
    String loginPin;
    @JsonKey(name: "trans_pin")
    String transPin;
    @JsonKey(name: "verified_email")
    int verifiedEmail;
    @JsonKey(name: "last_time_api_called")
    String lastTimeApiCalled;
    @JsonKey(name: "account_deleted")
    int accountDeleted;
    @JsonKey(name: "created_at")
    String createdAt;
    @JsonKey(name: "updated_at")
    DateTime updatedAt;

    UserDetails({
        required this.id,
        required this.fname,
        required this.lname,
        required this.email,
        required this.phoneno,
        required this.wallet,
        required this.status,
        required this.loginPin,
        required this.transPin,
        required this.verifiedEmail,
        required this.lastTimeApiCalled,
        required this.accountDeleted,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
