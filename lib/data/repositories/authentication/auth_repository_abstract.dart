import 'package:dartz/dartz.dart';
import 'package:payment_app/core/failures/failures.dart';
import 'package:payment_app/models/authentication/items/createpin_item.dart';
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/models/authentication/user_model.dart';

abstract class AuthenticationRepository {
  //********* Resgister Repository ********//
  Future<Either<Failure, UserModel>> register({required RegisterItem data});

  //********* Verify Email Repository ********//
  Future<Either<Failure, UserModel>> verifyEmail(
      {required VerifyEmailItem data});

  //********* Create Pin  Repository ********//
  Future<Either<Failure, UserModel>> createPin({required CreatePinItem data});

  //********* Login Repository ********//
  Future<Either<Failure, UserModel>> login({required LogInItem data});

  //********* Get User Details Repository ********//
  Future<Either<Failure, UserDetails>> getUserDetails();
}
