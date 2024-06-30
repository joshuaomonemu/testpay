import 'package:payment_app/core/failures/failures.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/authentication/user_model.dart';
import 'package:payment_app/models/response/response_model.dart';

//********************** LOGIN STATE  ******************************//
class LoginAuthState {}

class AuthenticationInitial extends LoginAuthState {}

class LoginLoadingState extends LoginAuthState {}

class LoginFailureState extends LoginAuthState {
  final Failure failure;

  LoginFailureState(this.failure);
}

class LoginSuccessState extends LoginAuthState {
  final UserModel success;

  LoginSuccessState(this.success);
}

//********************* REGISTRATION STATE  ****************************//
class RegisterAuthState {}

class RegisterAuthInitial extends RegisterAuthState {}

class RegisterLoadingState extends RegisterAuthState {}

class RegisterFailureState extends RegisterAuthState {
  final Failure failure;

  RegisterFailureState(this.failure);
}

class RegisterSuccessState extends RegisterAuthState {
  final UserModel success;

  RegisterSuccessState(this.success);
}

//********************** RESEND OTP STATE  ****************************//
class ResendOTPAuthState {}

class ResendOTPInitial extends ResendOTPAuthState {}

class ResendOTPLoadingState extends ResendOTPAuthState {}

class ResendOTPFailureState extends ResendOTPAuthState {
  final Failure failure;

  ResendOTPFailureState(this.failure);
}

class ResendOTPSuccessState extends ResendOTPAuthState {
  final ResponseModel success;

  ResendOTPSuccessState(this.success);
}

//********************** VERIFY EMAIL STATE  **************************//
class VeriFyEmailAuthState {}

class VerifyEmailInitial extends VeriFyEmailAuthState {}

class VerifyEmailLoadingState extends VeriFyEmailAuthState {}

class VerifyEmailFailureState extends VeriFyEmailAuthState {
  final Failure failure;

  VerifyEmailFailureState(this.failure);
}

class VerifyEmailSuccessState extends VeriFyEmailAuthState {
  final UserModel success;

  VerifyEmailSuccessState(this.success);
}

//********************* CREATE PIN STATE  ****************************//
class CreatePinAuthState {}

class CreatePinInitial extends CreatePinAuthState {}

class CreatePinLoadingState extends CreatePinAuthState {}

class CreatePinFailureState extends CreatePinAuthState {
  final Failure failure;

  CreatePinFailureState(this.failure);
}

class CreatePinSuccessState extends CreatePinAuthState {
  final UserModel success;

  CreatePinSuccessState(this.success);
}

//********************** GET USER DETAILS STATE  ************************ */
class GetUserDetailsAuthState {}

class GetUserDetailsInitial extends GetUserDetailsAuthState {}

class GetUserDetailsLoadingState extends GetUserDetailsAuthState {}

class GetUserDetailsFailureState extends GetUserDetailsAuthState {
  final Failure failure;
  GetUserDetailsFailureState(this.failure);
}

class GetUserDetailsSuccessState extends GetUserDetailsAuthState {
  final UserDetails success;
  GetUserDetailsSuccessState(this.success);
}
