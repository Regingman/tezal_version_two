import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:tezal_version_two/UI/screens/login/login_screen.dart';

class IntroScreen extends StatefulWidget {
  static String route = "intro_screen";
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      [page, page2, page3],
      onTapDoneButton: () =>
          Navigator.of(context).pushReplacementNamed(LoginScreen.route),
      showSkipButton: true,
      skipText:
          Text('ПРОПУСТИТЬ', style: TextStyle(fontWeight: FontWeight.bold)),
      doneText: Text('НАЧАТЬ', style: TextStyle(fontWeight: FontWeight.bold)),
      pageButtonTextStyles: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontFamily: "Regular",
      ),
    );
  }
}

final page = PageViewModel(
  pageColor: Colors.orange,
  // iconImageAssetPath: 'assets/taxi-driver.png',
  iconColor: Colors.blue,
  bubbleBackgroundColor: Colors.red,
  body: Text(
    'Начните свой путь к закупке товаров в онлайне!',
  ),
  title: Text('Закупка товаров'),
  mainImage: Image.asset(
    'assets/intro_1.png',
    height: 285.0,
    width: 285.0,
    alignment: Alignment.center,
  ),
  textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);

final page2 = PageViewModel(
  pageColor: Colors.orange,
  // iconImageAssetPath: 'assets/taxi-driver.png',
  iconColor: Colors.blue,
  bubbleBackgroundColor: Colors.red,
  body: Text(
    'Вместе с нами и нашими партнерами мы предоставляем лучшую в Кыргызстане платформу!',
  ),
  title: Text('Кыргызстан'),
  mainImage: Image.asset(
    'assets/intro_2.png',
    height: 285.0,
    width: 285.0,
    alignment: Alignment.center,
  ),
  textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);

final page3 = PageViewModel(
  pageColor: Colors.orange,
  // iconImageAssetPath: 'assets/taxi-driver.png',
  iconColor: Colors.blue,
  bubbleBackgroundColor: Colors.red,
  body: Text(
    'Мы всегда тебе рады и ждем тебя! И пусть этот день будет незабываем!',
  ),
  title: Text('Приветствие'),
  mainImage: Image.asset(
    'assets/intro_3.jpg',
    height: 300.0,
    width: 300.0,
    alignment: Alignment.center,
  ),
  textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
);
