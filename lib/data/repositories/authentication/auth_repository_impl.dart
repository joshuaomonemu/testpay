import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/constants/error_strings.dart';
import 'package:payment_app/core/failures/failures.dart';
import 'package:payment_app/core/network/network_info.dart';
import 'package:payment_app/core/runner/service.dart';
import 'package:payment_app/data/repositories/authentication/auth_repository_abstract.dart';
import 'package:payment_app/data/sources/authentications/auth_remote/auth_remote_abstract.dart';
import 'package:payment_app/models/authentication/items/createpin_item.dart';
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/models/authentication/user_model.dart';
import 'package:payment_app/models/response/response_model.dart';
import 'package:payment_app/providers/network_provider.dart';
import 'package:payment_app/providers/source_provider.dart';
import 'package:payment_app/services/secure_storage.dart';
import 'package:payment_app/services/user_manager/auth_manager.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo _networkInfo;
  final AuthRemoteDataSource _authRemoteSource;

  AuthenticationRepositoryImpl({required Ref ref})
      : _authRemoteSource = ref.read(authRemoteSourceProvider),
        _networkInfo = ref.read(networkInfoProvider);

  //********** Login **********************/
  @override
  Future<Either<Failure, UserModel>> login({required LogInItem data}) async {
    ServiceRunner<Failure, UserModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _authRemoteSource.login(logInItem: data).then((value) {
        value.password = data.password;
        SecureStorage().userSave(value);
        SecureStorage().emailSave(value.email ?? "");
        return AuthManager.instance.saveAuthenticatedUser(value);
      }),
      errorTitle: ErrorStrings.LOG_IN_ERROR,
    );
  }

//********** Register **********************/
  @override
  Future<Either<Failure, UserModel>> register(
      {required RegisterItem data}) async {
    ServiceRunner<Failure, UserModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _authRemoteSource.register(registerItem: data).then((value) async {
        value.email = data.email;
        SecureStorage().emailSave(value.email ?? "");
        AuthManager.instance.saveAuthenticatedUser(value);
        return value;
      }),
      errorTitle: ErrorStrings.REGISTER_ERROR,
    );
  }

//********** Verify Email **********************/
  @override
  Future<Either<Failure, UserModel>> verifyEmail(
      {required VerifyEmailItem data}) async {
    ServiceRunner<Failure, UserModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      navigateout: true,
      call: _authRemoteSource.verifyEmail(verifyMailItem: data).then((value) {
        return AuthManager.instance.saveAuthenticatedUser(value);
      }),
      errorTitle: ErrorStrings.MAIL_VERIFICATION_ERROR,
    );
  }


//********** Create Pin **********************/
  @override
  Future<Either<Failure, UserModel>> createPin(
      {required CreatePinItem data}) async {
    ServiceRunner<Failure, UserModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _authRemoteSource.createPin(createPinItem: data).then((value) async {
        return value;
      }),
      errorTitle: ErrorStrings.REGISTER_ERROR,
    );
  }  

  //********** Get User Details **********************/
  @override
  Future<Either<Failure, UserDetails>> getUserDetails() async {
    ServiceRunner<Failure, UserDetails> sR = ServiceRunner(_networkInfo);
    return sR.tryRemoteandCatch(
      navigateout: true,
      call: _authRemoteSource.getUserDetails(),
      errorTitle: ErrorStrings.GET_USER_DETAILS_ERROR,
    );
  }    
}


