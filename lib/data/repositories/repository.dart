import 'package:google_sign_in/google_sign_in.dart';
import 'package:tezal_version_two/UI/screens/registration/registration_screen.dart';
import 'package:tezal_version_two/data/models/container.dart';
import 'package:tezal_version_two/data/models/container_category.dart';
import 'package:tezal_version_two/data/models/user.dart';
import 'package:tezal_version_two/data/service/local_user_service.dart';
import 'package:tezal_version_two/data/service/provider/container_category_provaider.dart';
import 'package:tezal_version_two/data/service/provider/user_provaider.dart';

class Repository {
  String token = "";
  //Providers
  UserProvider _userProvider = UserProvider();
  ContainerCategoryProvaider _containerCategoryProvaider =
      new ContainerCategoryProvaider();
  //Models
  User user;
  List<ContainerCategory> categories = [];
  List<Container> containers = [];

  Future<bool> initAll() async {
    this.categories = await _containerCategoryProvaider.getAll(token);
    this.categories.forEach((v) {
      v.container.forEach((cont) {
        this.containers.add(cont);
      });
    });
    print('rep: initAll');
    return true;
  }

  Future<bool> registrateUser({
    String login,
    String password,
    RegistrationType type,
    GoogleSignInAccount account,
  }) async {
    print('register');
    if (type == RegistrationType.email)
      await null;
    //_registrateByEmail(login, password, type);
    else if (type == RegistrationType.google) await null;
    //_registrateByGoogle(account, type);

    return true;
  }

  /*Future _registrateByGoogle(
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
  }*/

  Future<bool> initUser(String username, String password) async {
    this.user = await _userProvider.getUserID(username, password);
    this.token = "Bearer_" + this.user.token;
    await LocalUserService.setUser(this.user);
    return true;
  }
}
