import 'dart:convert';
import 'dart:developer';

import 'package:payment_app/models/authentication/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  final emailKey = "userEmail";
  final verifiedKey = "estateJoined";
  final loginKey = "userLogin";
  // final userEstatedId = "userEstateId";

/////////////////////////////////////////////////////////////
/// Methods To save users details
/////////////////////////////////////////////////////////////
void userSave(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final valueToEncode = user.toJson();
    final value = jsonEncode(valueToEncode);
    prefs.setString(loginKey, value);
    log('saved $value');
  }

  Future<UserModel?> userRead() async {
    final prefs = await SharedPreferences.getInstance();
    final readValue = prefs.getString(loginKey) ?? "";
    log('read: $readValue');
    if (readValue.isEmpty) {
      return null;
    }
    return UserModel.fromJson(jsonDecode(readValue));
  }
 ///////////////////////////////////////////////////////     


  Future<String> emailRead() async {
    final prefs = await SharedPreferences.getInstance();
    final readValue = prefs.getString(emailKey) ?? "";
    log('read: $readValue');
    return readValue;
  }

  void emailSave(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final value = email;
    prefs.setString(emailKey, value);
    log('saved $value');
  }

  Future<int> verifiedEmailRead() async {
    final prefs = await SharedPreferences.getInstance();
    final readValue = prefs.getString(verifiedKey) ?? 0;
    log('read: $readValue');
    return int.parse(readValue.toString());
  }

  void verifiedEmailSave(int verifiedEmail) async {
    final prefs = await SharedPreferences.getInstance();
    final value = verifiedEmail.toString();
    prefs.setString(verifiedKey, value);
    log('saved $value');
  }

  void clearEmailAndEstate() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(verifiedKey);
  }

  void clearAllStorage() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove(emailKey);
    prefs.remove(verifiedKey);
    prefs.remove(loginKey);

  }

  // void getUserEstateId() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userEstateId', value);
  // }
}
