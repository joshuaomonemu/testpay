import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/state/paystack/paystack_notifier.dart';
import 'package:payment_app/state/paystack/paystack_state.dart';

//**************** CREATE PIN NOTIFIER PROVIDER  **********************//
final payStackNotifierProvider =
    StateNotifierProvider<PaystackStateNotifier, PaystackState>(
  (ref) => PaystackStateNotifier(ref),
);
