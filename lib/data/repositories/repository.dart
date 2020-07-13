import 'package:google_sign_in/google_sign_in.dart';
import 'package:tezal_version_two/UI/screens/registration/registration_screen.dart';
import 'package:tezal_version_two/data/models/user.dart';
import 'package:tezal_version_two/data/service/local_user_service.dart';
import 'package:tezal_version_two/data/service/provider/user_provaider.dart';

class Repository {
  UserProvider _userProvider = UserProvider();
  User user;

  Future<bool> registrateUser({
    String login,
    String password,
    RegistrationType type,
    GoogleSignInAccount account,
  }) async {
    print('object');
    if (type == RegistrationType.email)
      await _registrateByEmail(login, password, type);
    else if (type == RegistrationType.google)
      await _registrateByGoogle(account, type);

    return true;
  }

  Future _registrateByGoogle(
      GoogleSignInAccount account, RegistrationType type) async {
    print('object');
    await _userProvider.registrate(account: account, type: type);
    await initUserGoogle(account);
  }

  Future _registrateByEmail(
      String login, String password, RegistrationType type) async {
    await _userProvider.registrate(
        login: login, password: password, type: type);
    await initUserByEmail(login, password);
  }

  Future<bool> initUserGoogle(GoogleSignInAccount account) async {
    this.user = await _userProvider.getUserByGoogle(account);
    await LocalUserService.setUser(this.user);
    return true;
  }

  Future<bool> initUserByEmail(String email, String password) async {
    this.user = await _userProvider.getUserByEmail(email, password);
    await LocalUserService.setUser(this.user);
    return true;
  }
}
