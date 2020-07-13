import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  static String route = "main_screen";
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("Atai"),
    );
  }
}
