import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/data/repositories/authentication/auth_repository_abstract.dart';
import 'package:payment_app/data/repositories/authentication/auth_repository_impl.dart';
import 'package:payment_app/data/repositories/paystack/paystack_repository_abstract.dart';
import 'package:payment_app/data/repositories/paystack/paystack_repository_impl.dart';

//********** AUTHENTICATION PROVIDER *************************//
final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => AuthenticationRepositoryImpl(ref: ref),
);

//********** Paystack PROVIDER *************************//
final paystackRepositoryProvider = Provider<PaystackRepository>(
  (ref) => PaystackRepositoryImpl(ref: ref),
);
