import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/constants/error_strings.dart';
import 'package:payment_app/core/failures/failures.dart';
import 'package:payment_app/core/network/network_info.dart';
import 'package:payment_app/core/runner/service.dart';
import 'package:payment_app/data/repositories/authentication/auth_repository_abstract.dart';
import 'package:payment_app/data/repositories/paystack/paystack_repository_abstract.dart';
import 'package:payment_app/data/sources/authentications/auth_remote/auth_remote_abstract.dart';
import 'package:payment_app/data/sources/paystack/paystack_remote_source.dart';
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/models/authentication/user_model.dart';
import 'package:payment_app/models/paystack/items/paystack_initialize_item.dart';
import 'package:payment_app/models/paystack/paystack_auth_response.dart';
import 'package:payment_app/models/response/response_model.dart';
import 'package:payment_app/providers/network_provider.dart';
import 'package:payment_app/providers/source_provider.dart';

class PaystackRepositoryImpl implements PaystackRepository {
  final NetworkInfo _networkInfo;
  final PaystackRemoteDataSourceImpl _paystackRemoteSource;

  PaystackRepositoryImpl({required Ref ref})
      : _paystackRemoteSource = ref.read(paystackSourceProvider
            as ProviderListenable<PaystackRemoteDataSourceImpl>),
        _networkInfo = ref.read(networkInfoProvider);

//********** Initialize Paystaack **********************/
  @override
  Future<Either<Failure, PaystackAuthResponse>> initializePaystack(
      {required PaystackIntializeItem data}) async {
    ServiceRunner<Failure, PaystackAuthResponse> sR =
        ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _paystackRemoteSource
          .initializePaystack(payStackIntializeItem: data)
          .then((value) async {
        return value;
      }),
      errorTitle: ErrorStrings.REGISTER_ERROR,
    );
  }
}
