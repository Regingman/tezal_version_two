import 'package:flutter/material.dart';
import 'package:tezal_version_two/ui/screens/main/main_screen.dart';

import 'UI/screens/registration/registration_screen.dart';
import 'ui/screens/intro/intro_screen.dart';
import 'ui/screens/login/login_screen.dart';

// #51597e
// #ff0000
// #151721

ThemeData getTheme() {
  return ThemeData(
    primaryColor: Color(0xff342b38),
    accentColor: Color(0xffff0000),
    scaffoldBackgroundColor: Color(0xff151721),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white.withOpacity(0.7),
      ),
      bodyText2: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.8),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      MainScreen.route: (context) => MainScreen(),
      LoginScreen.route: (context) => LoginScreen(),
      RegistrationScreen.route: (context) => RegistrationScreen(),
      IntroScreen.route: (context) => IntroScreen(),
    };
