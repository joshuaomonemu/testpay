import 'package:flutter/material.dart';

// API Base URL == 'https://nurquest.com/api/'

class EndPoint {
  static const _base = 'https://dogwifbutt.org/payment_app/api/';

  ////////////////////////////////////////////////////////
  /// AUTHENTICATION ENDPOINTS
  ////////////////////////////////////////////////////////

  //******* Register Endpoints *************************/
  static const registerUser = '$_base/user/auth/register.php';
  static const verifyOTP = '$_base/user/auth/verifyotp.php';
  static const loginUser = '$_base/user/auth/userlogin.php';
  static const resendOTP = '$_base/user/auth/resendOTP.php';
  static const createPin = '$_base/user/auth/createpin.php';
  static const forgotPassword = '$_base/user/auth/forgotpassword.php';
  static const resetPassword = '$_base/user/auth/resetPassword.php';
  static const changePassword = '$_base/user/auth/userchangepass.php';
  static const deleteAccount = '$_base/user/account/deleteuser.php';

  //******* Account Endpoints *************************/
  static const getUserDetails = '$_base/user/account/getdetails.php';
  static const intializePaystack = '$_base/user/topup/initialize.php';
}
