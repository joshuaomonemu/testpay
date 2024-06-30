import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/state/authentication/auth_notifier.dart';
import 'package:payment_app/state/authentication/auth_state.dart';

//**************** REGISTER NOTIFIER PROVIDER  **********************//
final registerNotifierProvider =
    StateNotifierProvider<RegisterStateNotifier, RegisterAuthState>(
  (ref) => RegisterStateNotifier(ref),
);

//**************** VERIFY EMAIL NOTIFIER PROVIDER  **********************//
final verifyEmailNotifierProvider =
    StateNotifierProvider<VerifyEmailStateNotifier, VeriFyEmailAuthState>(
  (ref) => VerifyEmailStateNotifier(ref),
);

//**************** CREATE PIN NOTIFIER PROVIDER  **********************//
final createPinNotifierProvider =
    StateNotifierProvider<CreatePinStateNotifier, CreatePinAuthState>(
  (ref) => CreatePinStateNotifier(ref),
);

//**************** LOGIN NOTIFIER PROVIDER  **********************//
final loginNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, LoginAuthState>(
  (ref) => LoginStateNotifier(ref),
);

//**************** USER DETAILS PROVIDER  **********************//
final getUserDetailsNotifierProvider =
    StateNotifierProvider<GetUserDetailsStateNotifier, GetUserDetailsAuthState>(
  (ref) => GetUserDetailsStateNotifier(ref),
);