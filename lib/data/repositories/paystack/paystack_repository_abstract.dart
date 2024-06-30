import 'package:dartz/dartz.dart';
import 'package:payment_app/core/failures/failures.dart';
import 'package:payment_app/models/paystack/items/paystack_initialize_item.dart';
import 'package:payment_app/models/paystack/paystack_auth_response.dart';

abstract class PaystackRepository {
  //********* Initialize Paystack  Repository ********//
  Future<Either<Failure, PaystackAuthResponse>> initializePaystack(
      {required PaystackIntializeItem data});
}
