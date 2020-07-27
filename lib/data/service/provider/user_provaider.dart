import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:tezal_version_two/UI/screens/registration/registration_screen.dart';
import 'package:tezal_version_two/data/models/user.dart';

import '../api_service.dart';

class UserProvider {
  // login
  Future<User> getUserID(String username, String password) async {
    Map data = {'username': username, 'password': password};
    var response = await http.post(
      ApiService.login,
      headers: {"Content-Type": "application/json"},
      body: utf8.encode(json.encode(data)),
    );

    print("user: " + response.statusCode.toString());
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse == 488)
      throw Exception([jsonResponse, username, password]);
    if (jsonResponse == 401) throw Exception(jsonResponse);
    // сделать еще один запрос, с данными юзера или же возвращать их сразу на сервере
    User user = User.fromJson(jsonResponse);
    if (user.name == null) {
      user.name = "";
    }
    if (user.userName == null) {
      user.userName = "";
    }
    if (user.phone == null) {
      user.phone = "";
    }
    return user;
  }

  // registration interface
  Future<bool> registrate({
    String login,
    String password,
    RegistrationType type,
    GoogleSignInAccount account,
  }) async {
    switch (type) {
      case RegistrationType.email:
        return await null;
        //     _registrateByEmail(login, password);
        break;
      case RegistrationType.google:
        return await null;
      // _registrateByGoogle(account);

      default:
        throw Exception('данная функция в разработке');
    }
  }
  // registration back

}
