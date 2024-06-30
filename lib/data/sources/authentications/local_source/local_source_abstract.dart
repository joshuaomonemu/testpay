import 'package:payment_app/models/authentication/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> saveAuthenticatedUser(UserModel authUser);
  Future<bool> clearAuthenticatedUser();
  Future<UserModel?> getAuthenticatedUser();
  Stream<UserModel?> streamUserStatus();

  // user details
  // Future<UserDetails> saveUserDetails(UserDetails userDetails);
  // Future<bool> clearUserDetails();
  // Future<UserDetails?> getSavedUserDetails();
  // Stream<UserDetails?> streamUserDetailsStatus();
}
