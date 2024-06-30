import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/providers/state_notifier_provider/auth_provider.dart';

class AllApiCalls {
  static int isAPiCalled = 0;
  static int appStatesReset = 0;
  static resetData() {
    isAPiCalled = 0;
  }
  static makeAllApiCalls(WidgetRef ref, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // call all get api here
      callUserData(ref, context);

      isAPiCalled = 1;
    });
  }
  static callUserData(WidgetRef ref, BuildContext context) {
    ///////// API CALLS ////////////////////////////////
    ref
        .read(getUserDetailsNotifierProvider.notifier)
        .getUserDetails(context: context);
    
  }
}
