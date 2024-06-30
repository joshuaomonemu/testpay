import 'package:payment_app/core/failures/failures.dart';
import 'package:payment_app/models/paystack/paystack_auth_response.dart';

//********************** LOGIN STATE  ******************************//
class PaystackState {}

class PaystackInitial extends PaystackState {}

class PaystackLoadingState extends PaystackState {}

class PaystackFailureState extends PaystackState {
  final Failure failure;

  PaystackFailureState(this.failure);
}

class PaystackSuccessState extends PaystackState {
  final PaystackAuthResponse success;

  PaystackSuccessState(this.success);
}
