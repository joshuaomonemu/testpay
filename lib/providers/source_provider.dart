import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/data/sources/authentications/auth_remote/auth_remote_abstract.dart';
import 'package:payment_app/data/sources/authentications/auth_remote/auth_remote_source.dart';
import 'package:payment_app/data/sources/paystack/paystack_remote_abstract.dart';
import 'package:payment_app/data/sources/paystack/paystack_remote_source.dart';

import 'package:payment_app/providers/network_provider.dart';

/////********** AUTHENTICATION PROVIDER SOURCES ************//
final authRemoteSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

/////********** PAYSTACK PROVIDER SOURCES ************//
final paystackSourceProvider = Provider<PaystackRemoteDataSource>(
  (ref) => PaystackRemoteDataSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
