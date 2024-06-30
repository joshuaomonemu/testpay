import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/constants/widgets/app_snackbar.dart';
import 'package:payment_app/core/internet_check/internet_check.dart';
import 'package:payment_app/data/repositories/authentication/auth_repository_abstract.dart';
import 'package:payment_app/data/repositories/paystack/paystack_repository_abstract.dart';
import 'package:payment_app/models/paystack/items/paystack_initialize_item.dart';
import 'package:payment_app/providers/repo_provider.dart';
import 'package:payment_app/providers/source_provider.dart';
import 'package:payment_app/state/paystack/paystack_state.dart';

//********************* CREATE PIN NOTIFIER  ************************//
class PaystackStateNotifier extends StateNotifier<PaystackState> {
  final PaystackRepository _paystackRepository;

  PaystackStateNotifier(Ref ref)
      : _paystackRepository = ref.read(paystackRepositoryProvider),
        super(PaystackInitial());

  Future<void> initializePaystack({
    required PaystackIntializeItem data,
    required BuildContext context,
  }) async {
    bool value = await InternetCheck().internetConnectionHandler(context);

    if (!value) {
      return;
    }

    state = PaystackLoadingState();

    final getAllTopupProductListOrError =
        await _paystackRepository.initializePaystack(data: data);

    state = getAllTopupProductListOrError.fold(
      (l) => PaystackFailureState(l),
      (r) => PaystackSuccessState(r),
    );

    if (state is PaystackFailureState) {
      final failure = state as PaystackFailureState;
      final failureMessaege = failure.failure.message;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ShowToast.errorToast(context, failureMessaege);
      });
      resetState();
    }
  }

  void resetState() {
    state = PaystackInitial();
  }
}
