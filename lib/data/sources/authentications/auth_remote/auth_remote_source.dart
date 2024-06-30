import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:payment_app/core/api/api_endpoints.dart';
import 'package:payment_app/core/network/network_request.dart';
import 'package:payment_app/core/network/network_retry.dart';
import 'package:payment_app/data/sources/authentications/auth_remote/auth_remote_abstract.dart';
import 'package:payment_app/models/authentication/items/createpin_item.dart';
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/models/authentication/user_model.dart';
import 'package:payment_app/models/response/response_model.dart';
import 'package:payment_app/services/user_manager/auth_manager.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // call network connection class
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  AuthRemoteDataSourceImpl(
      {required this.networkRequest, required this.networkRetry});
//////////////////////////////////////////////////////////////////////
  /// REGISTER SOURCE
//////////////////////////////////////////////////////////////////////
  @override
  Future<UserModel> register({required RegisterItem registerItem}) async {
    String url = EndPoint.registerUser; //url

    final body = {
      "email": registerItem.email,
      "fname": registerItem.fName,
      "lname": registerItem.lName,
    };

    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ),
    );

    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final UserModel authToken = UserModel.fromJson(data['data']);
        return authToken;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final erroMessage = data['text'];
          throw Exception(erroMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }

//////////////////////////////////////////////////////////////////////
  /// VERIFY EMAIL SOURCE
////////////////////////////////////////////////////////////////////
  @override
  Future<UserModel> verifyEmail(
      {required VerifyEmailItem verifyMailItem}) async {
    String url = EndPoint.verifyOTP; //url
    String authToken = AuthManager.instance.userCred?.token ?? '';
    final body = {"token": verifyMailItem.token, "verifyMethod": 1};

    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: jsonEncode(
          body,
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $authToken',
        },
      ),
    );

    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final UserModel authToken = UserModel.fromJson(data['data']);
        return authToken;
      } on Exception catch (_) {
        rethrow;
      }
    } else if (response.statusCode == 401) {
      String error = data['text'];
      throw Exception("$error (401)");
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final erroMessage = data['text'];
          throw Exception(erroMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }

//////////////////////////////////////////////////////////////////////
  /// CREATE PIN SOURCE
//////////////////////////////////////////////////////////////////////
  @override
  Future<UserModel> createPin({required CreatePinItem createPinItem}) async {
    String url = EndPoint.createPin; //url

    final body = {
      "loginpin": createPinItem.pinLogin,
      "transpin": createPinItem.pinTrans,
    };
    String accessToken = AuthManager.instance.userCred?.token ?? "";
    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        },
      ),
    );

    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final UserModel authToken = UserModel.fromJson(data['data']);
        return authToken;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final erroMessage = data['text'];
          throw Exception(erroMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }

//////////////////////////////////////////////////////////////////////
  /// LOGIN SOURCE
//////////////////////////////////////////////////////////////////////
  @override
  Future<UserModel> login({required LogInItem logInItem}) async {
    String url = EndPoint.loginUser; //url
    final body = {
      "email": logInItem.email,
      "password": logInItem.password,
    };

    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ),
    );
    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final UserModel authToken = UserModel.fromJson(data['data']);
        return authToken;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final erroMessage = data['text'];
          throw Exception(erroMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }

  //////////////////////////////////////////////////////////////////////
  /// GET USERS DETAILS SOURCE
  ///////////////////////////////////////////////////////////////////////
  @override
  Future<UserDetails> getUserDetails() async {
    String url = EndPoint.getUserDetails; //url
    String authToken = AuthManager.instance.userCred?.token ?? '';
    final response =
        await networkRetry.networkRetry(() => networkRequest.get(url, headers: {
              HttpHeaders.authorizationHeader: 'Bearer $authToken',
            }));

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final UserDetails userDetails = UserDetails.fromJson(data['data']);
        return userDetails;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final erroMessage = data['text'];
          throw Exception(erroMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }  
}


