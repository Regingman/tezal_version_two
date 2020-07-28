import 'package:flutter/material.dart';
import 'package:tezal_version_two/UI/screens/home/home_screen.dart';

import 'UI/screens/registration/registration_screen.dart';
import 'ui/screens/intro/intro_screen.dart';
import 'ui/screens/login/login_screen.dart';

// #51597e
// #ff0000
// #151721

ThemeData getTheme() {
  return ThemeData(
    primaryColor: Colors.orange,
    accentColor: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      labelStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      HomeScreen.route: (context) => HomeScreen(),
      LoginScreen.route: (context) => LoginScreen(),
      RegistrationScreen.route: (context) => RegistrationScreen(),
      IntroScreen.route: (context) => IntroScreen(),
    };
