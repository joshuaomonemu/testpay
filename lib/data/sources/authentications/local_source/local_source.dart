import 'package:hive/hive.dart';
import 'package:payment_app/data/sources/authentications/local_source/local_source_abstract.dart';
import 'package:payment_app/models/authentication/user_model.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userKey = 'auth_user';
  static const String _userDetailsKey = 'user_details';

  @override
  Future<bool> clearAuthenticatedUser() async {
    final box = await Hive.openBox<UserModel>(_userKey);

    try {
      box.clear();
      return true;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {}
  }

  @override
  Future<UserModel> saveAuthenticatedUser(UserModel authUser) async {
    final box = await Hive.openBox<UserModel>(_userKey);

    try {
      await box.put(_userKey, authUser);
      return authUser;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {}
  }

  @override
  Future<UserModel?> getAuthenticatedUser() async {
    final box = await Hive.openBox<UserModel>(_userKey);

    try {
      final authCred = box.get(_userKey);
      return authCred;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<UserModel?> streamUserStatus() async* {
    final box = await Hive.openBox<UserModel>(_userKey);

    yield* box.watch(key: _userKey).map((event) {
      return event.value as UserModel;
    }).asBroadcastStream();
  }

  // @override
  // Future<bool> clearUserDetails() async {
  //   final box = await Hive.openBox<UserDetails>(_userDetailsKey);

  //   try {
  //     box.clear();
  //     return true;
  //   } on Exception catch (e) {
  //     throw Exception(e);
  //   } finally {}
  // }

  // @override
  // Future<UserDetails> saveUserDetails(UserDetails userDetails) async {
  //   final box = await Hive.openBox<UserDetails>(_userDetailsKey);

  //   try {
  //     await box.put(_userDetailsKey, userDetails);
  //     return userDetails;
  //   } on Exception catch (e) {
  //     throw Exception(e);
  //   } finally {}
  // }

  // @override
  // Future<UserDetails?> getSavedUserDetails() async {
  //   final box = await Hive.openBox<UserDetails>(_userDetailsKey);

  //   try {
  //     final authCred = box.get(_userDetailsKey);
  //     return authCred;
  //   } on Exception catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // @override
  // Stream<UserDetails?> streamUserDetailsStatus() async* {
  //   final box = await Hive.openBox<UserDetails>(_userDetailsKey);

  //   yield* box.watch(key: _userDetailsKey).map((event) {
  //     return event.value as UserDetails;
  //   }).asBroadcastStream();
  // }
}
