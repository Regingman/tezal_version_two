import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  static String route = "intro_screen";
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("Atai"),
    );
  }
}
