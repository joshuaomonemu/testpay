import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/constants/widgets/app_snackbar.dart';
import 'package:payment_app/core/internet_check/internet_check.dart';
import 'package:payment_app/data/repositories/authentication/auth_repository_abstract.dart';
import 'package:payment_app/models/authentication/items/createpin_item.dart';
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/providers/repo_provider.dart';
import 'package:payment_app/state/authentication/auth_state.dart';

class LoginStateNotifier extends StateNotifier<LoginAuthState> {
  final AuthenticationRepository _authenticationRepository;

  LoginStateNotifier(Ref ref)
      : _authenticationRepository = ref.read(authRepositoryProvider),
        super(AuthenticationInitial());

  Future<void> login(
      {required LogInItem data, required BuildContext context}) async {
    bool value = await InternetCheck().internetConnectionHandler(context);

    if (!value) {
      return;
    }

    state = LoginLoadingState();

    final loginListOrError = await _authenticationRepository.login(data: data);

    state = loginListOrError.fold(
      (l) => LoginFailureState(l),
      (r) => LoginSuccessState(r),
    );

    if (state is LoginFailureState) {
      final failure = state as LoginFailureState;
      final failureMessaege = failure.failure.message;
      ShowToast.errorToast(context, failureMessaege);
      resetState();
    }
  }

  void resetState() {
    state = AuthenticationInitial();
  }
}

//********************* REGISTER NOTIFIER  ***************************//
class RegisterStateNotifier extends StateNotifier<RegisterAuthState> {
  final AuthenticationRepository _authenticationRepository;

  RegisterStateNotifier(Ref ref)
      : _authenticationRepository = ref.read(authRepositoryProvider),
        super(RegisterAuthInitial());

  Future<void> register({
    required RegisterItem data,
    required BuildContext context,
  }) async {
    bool value = await InternetCheck().internetConnectionHandler(context);

    if (!value) {
      return;
    }
    state = RegisterLoadingState();

    final getAllTopupProductListOrError =
        await _authenticationRepository.register(data: data);

    state = getAllTopupProductListOrError.fold(
      (l) => RegisterFailureState(l),
      (r) => RegisterSuccessState(r),
    );
  }

  void resetState() {
    state = RegisterAuthInitial();
  }
}

//********************* VERIFY EMAIL NOTIFIER  ************************//
class VerifyEmailStateNotifier extends StateNotifier<VeriFyEmailAuthState> {
  final AuthenticationRepository _authenticationRepository;

  VerifyEmailStateNotifier(Ref ref)
      : _authenticationRepository = ref.read(authRepositoryProvider),
        super(VerifyEmailInitial());

  Future<void> verifyEmail({
    required VerifyEmailItem data,
    required BuildContext context,
  }) async {
    bool value = await InternetCheck().internetConnectionHandler(context);

    if (!value) {
      return;
    }

    state = VerifyEmailLoadingState();

    final getAllTopupProductListOrError =
        await _authenticationRepository.verifyEmail(data: data);

    state = getAllTopupProductListOrError.fold(
      (l) => VerifyEmailFailureState(l),
      (r) => VerifyEmailSuccessState(r),
    );

    if (state is VerifyEmailFailureState) {
      final failure = state as VerifyEmailFailureState;
      final failureMessaege = failure.failure.message;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ShowToast.errorToast(context, failureMessaege);
      });
      resetState();
    }
  }

  void resetState() {
    state = VerifyEmailInitial();
  }
}

//********************* CREATE PIN NOTIFIER  ************************//
class CreatePinStateNotifier extends StateNotifier<CreatePinAuthState> {
  final AuthenticationRepository _authenticationRepository;

  CreatePinStateNotifier(Ref ref)
      : _authenticationRepository = ref.read(authRepositoryProvider),
        super(CreatePinInitial());

  Future<void> createPin({
    required CreatePinItem data,
    required BuildContext context,
  }) async {
    bool value = await InternetCheck().internetConnectionHandler(context);

    if (!value) {
      return;
    }

    state = CreatePinLoadingState();

    final getAllTopupProductListOrError =
        await _authenticationRepository.createPin(data: data);

    state = getAllTopupProductListOrError.fold(
      (l) => CreatePinFailureState(l),
      (r) => CreatePinSuccessState(r),
    );

    if (state is CreatePinFailureState) {
      final failure = state as CreatePinFailureState;
      final failureMessaege = failure.failure.message;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ShowToast.errorToast(context, failureMessaege);
      });
      resetState();
    }
  }

  void resetState() {
    state = CreatePinInitial();
  }
}

//********************* GET USER DETAILS NOTIFIER  *************************
class GetUserDetailsStateNotifier
    extends StateNotifier<GetUserDetailsAuthState> {
  final AuthenticationRepository _authenticationRepository;
  GetUserDetailsStateNotifier(Ref ref)
      : _authenticationRepository = ref.read(authRepositoryProvider),
        super(GetUserDetailsInitial());
  Future<void> getUserDetails({
    required BuildContext context,
  }) async {
    bool value = await InternetCheck().internetConnectionHandler(context);

    if (!value) {
      return;
    }

    state = GetUserDetailsLoadingState();
    final getUserDetailsorError =
        await _authenticationRepository.getUserDetails();
    state = getUserDetailsorError.fold(
      (l) => GetUserDetailsFailureState(l),
      (r) => GetUserDetailsSuccessState(r),
    );
  }
}
