import 'package:payment_app/models/authentication/items/createpin_item.dart';
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/models/authentication/user_model.dart';
import 'package:payment_app/models/response/response_model.dart';

abstract class AuthRemoteDataSource {
//********** Register **********************/
  Future<UserModel> register({
    required RegisterItem registerItem,
  });

//********** Verify Email **********************/
  Future<UserModel> verifyEmail({
    required VerifyEmailItem verifyMailItem,
  });

//********** CREATE PIN **********************/
  Future<UserModel> createPin({
    required CreatePinItem createPinItem,
  });

//********** CREATE PIN **********************/
  Future<UserModel> login({
    required LogInItem logInItem,
  });

  //********* GET USERS DETAILS ********//
  Future<UserDetails> getUserDetails();

}
