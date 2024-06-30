import 'package:payment_app/models/paystack/items/paystack_initialize_item.dart';
import 'package:payment_app/models/paystack/paystack_auth_response.dart';
import 'package:payment_app/models/response/response_model.dart';

abstract class PaystackRemoteDataSource {

  //********* Initialize Paystack ********//
  Future<PaystackAuthResponse> initializePaystack({
    required PaystackIntializeItem payStackIntializeItem,
  });
}
