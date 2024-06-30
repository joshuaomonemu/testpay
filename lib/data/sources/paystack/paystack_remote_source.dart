import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:payment_app/core/api/api_endpoints.dart';
import 'package:payment_app/core/network/network_request.dart';
import 'package:payment_app/core/network/network_retry.dart';
import 'package:payment_app/data/sources/paystack/paystack_remote_abstract.dart';
import 'package:payment_app/models/authentication/items/createpin_item.dart';
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/models/authentication/user_model.dart';
import 'package:payment_app/models/paystack/items/paystack_initialize_item.dart';
import 'package:payment_app/models/paystack/paystack_auth_response.dart';
import 'package:payment_app/models/response/response_model.dart';
import 'package:payment_app/services/user_manager/auth_manager.dart';

class PaystackRemoteDataSourceImpl implements PaystackRemoteDataSource {
  // call network connection class
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  PaystackRemoteDataSourceImpl(
      {required this.networkRequest, required this.networkRetry});
//////////////////////////////////////////////////////////////////////
  /// INITIALIZE PAYSTACK
//////////////////////////////////////////////////////////////////////
  @override
  Future<PaystackAuthResponse> initializePaystack(
      {required PaystackIntializeItem payStackIntializeItem}) async {
    String url = EndPoint.intializePaystack; //url

    final body = {
      "amount": payStackIntializeItem.amount,
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
        final PaystackAuthResponse authorization_url =
            PaystackAuthResponse.fromJson(data['data']['authorization_url']);
        return authorization_url;
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
