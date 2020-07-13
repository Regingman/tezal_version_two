import 'package:flutter/cupertino.dart';

enum RegistrationType { phone, email, google, facebook }

class RegistrationScreen extends StatefulWidget {
  static String route = "registration_screen";
  @override
  _RegistrationScreen createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("Atai"),
    );
  }
}
