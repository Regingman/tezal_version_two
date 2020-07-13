import 'package:flutter/material.dart';
import 'package:tezal_version_two/UI/widgets/app_bar.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppBarTitle(),
            Text('кино начинается с тебя'),
          ],
        ),
      ),
    );
  }
}
