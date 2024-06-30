// import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/data/sources/authentications/local_source/local_source.dart';
import 'package:payment_app/models/authentication/user_model.dart';

final authProvider = Provider<AuthManager?>((ref) => AuthManager.instance);

final streamUserProvider = StreamProvider.autoDispose<UserModel?>((ref) async* {
  yield* AuthManager.instance.streamActiveUser();
});

class AuthManager {
  static final AuthManager instance = AuthManager._();
  final AuthLocalDataSourceImpl _authlocalDataSource =
      AuthLocalDataSourceImpl();

  // final ProfileLocalDataSourceImpl _profileLocalDataSource =
  //     ProfileLocalDataSourceImpl();

  UserModel? userCred;

  AuthManager._() {
    init();
  }

  Future<void> init() async {
    userCred = await _authlocalDataSource.getAuthenticatedUser();
  }

  // Future<bool> updateLocalUserImage(File file) async {
  //   final isUpdated =
  //       await _profileLocalDataSource.updateUserDetailsLocalProfileImage(file);

  //   return isUpdated;
  // }

  Future<UserModel> saveAuthenticatedUser(UserModel authUser) async {
    return userCred =
        await _authlocalDataSource.saveAuthenticatedUser(authUser);
  }

  Future<UserModel?> getAuthenticatedUser() async {
    return userCred = await _authlocalDataSource.getAuthenticatedUser();
  }

  Future<bool> updateUserEmailVerified(bool emailVerifed) async {
    UserModel? user = await _authlocalDataSource.getAuthenticatedUser();

    if (user == null) return false;

    UserModel updatedUser =
        await _authlocalDataSource.saveAuthenticatedUser(user);

    if (updatedUser.email != null && updatedUser.password != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> clearAuthenticatedUser() async {
    await _authlocalDataSource.clearAuthenticatedUser();

    userCred = null;

    return true;
  }

  Stream<UserModel?> streamActiveUser() async* {
    yield* _authlocalDataSource
        .streamUserStatus()
        .map((event) => userCred = event)
        .asBroadcastStream();
  }
}








// import 'dart:io';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:payment_app/models/authentication/user_model.dart';

// final authProvider = Provider<AuthManager?>((ref) => AuthManager.instance);

// final streamUserProvider = StreamProvider.autoDispose<User?>((ref) async* {
//   yield* AuthManager.instance.streamActiveUser();
// });

// class AuthManager {
//   static final AuthManager instance = AuthManager._();
//   final AuthLocalDataSourceImpl _authlocalDataSource =
//       AuthLocalDataSourceImpl();

//   final ProfileLocalDataSourceImpl _profileLocalDataSource =
//       ProfileLocalDataSourceImpl();

//   UserModel? userCred;

//   AuthManager._() {
//     init();
//   }

//   Future<void> init() async {
//     userCred = await _authlocalDataSource.getAuthenticatedUser();
//   }

//   Future<bool> updateLocalUserImage(File file) async {
//     final isUpdated =
//         await _profileLocalDataSource.updateUserDetailsLocalProfileImage(file);

//     return isUpdated;
//   }

//   Future<User> saveAuthenticatedUser(User authUser) async {
//     return userCred =
//         await _authlocalDataSource.saveAuthenticatedUser(authUser);
//   }

//   Future<User?> getAuthenticatedUser() async {
//     return userCred = await _authlocalDataSource.getAuthenticatedUser();
//   }

//   Future<bool> clearAuthenticatedUser() async {
//     await _authlocalDataSource.clearAuthenticatedUser();

//     userCred = null;

//     return true;
//   }

//   Stream<User?> streamActiveUser() async* {
//     yield* _authlocalDataSource
//         .streamUserStatus()
//         .map((event) => userCred = event)
//         .asBroadcastStream();
//   }
// }
