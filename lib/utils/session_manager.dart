import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static late SharedPreferences _preferences;

  static const _keyIsLoggedIn = "isLoggedIn";
  static const _keyUserEmail = "userEmail";
  static const _keyUserPassword = "userPassword";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserEmail(String userEmail) async =>
      await _preferences.setString(_keyUserEmail, userEmail);

  static String? getUserEmail() => _preferences.getString(_keyUserEmail);

  static Future setUserPassword(String userPassword) async =>
      await _preferences.setString(_keyUserPassword, userPassword);

  static String? getUserPassword() => _preferences.getString(_keyUserPassword);

  static Future setIsLoggedIn(bool isLoggedIn) async =>
      await _preferences.setBool(_keyIsLoggedIn, isLoggedIn);

  static bool? getIsLoggedIn() => _preferences.getBool(_keyIsLoggedIn);


}
