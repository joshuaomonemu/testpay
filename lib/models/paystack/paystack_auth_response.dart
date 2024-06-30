import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'paystack_auth_response.g.dart';

@JsonSerializable()
class PaystackAuthResponse {
    @JsonKey(name: "status")
    bool status;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "data")
    Data data;

    PaystackAuthResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory PaystackAuthResponse.fromJson(Map<String, dynamic> json) => _$PaystackAuthResponseFromJson(json);

    Map<String, dynamic> toJson() => _$PaystackAuthResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "authorization_url")
    String authorizationUrl;
    @JsonKey(name: "access_code")
    String accessCode;
    @JsonKey(name: "reference")
    String reference;

    Data({
        required this.authorizationUrl,
        required this.accessCode,
        required this.reference,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}
