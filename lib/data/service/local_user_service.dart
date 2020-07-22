import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezal_version_two/data/models/user.dart';

class LocalUserService {
  static Future<bool> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', json.encode(user.toJson()));
  }

  static Future<dynamic> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var userString = prefs.getString('user');
      var userJson = json.decode(userString);
      User user = User.fromJson(userJson);
      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }

  static Future<bool> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<bool> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('token');
  }
}
