import 'package:flutter/material.dart';
import 'package:tezal_version_two/UI/screens/login/login_screen.dart';
import 'package:tezal_version_two/UI/widgets/slider.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Приветствие",
        description:
            "Мы всегда тебе рады и ждем тебя! И пусть этот день будет незабываем!",
        image: "assets/intro_1.png"),
    SliderPage(
        title: "Кыргызстан",
        description:
            "Вместе с нами и нашими партнерами мы предоставляем лучшую в Кыргызстане платформу!",
        image: "assets/intro_2.png"),
    SliderPage(
        title: "Закупка товаров",
        description: "Начните свой путь к закупке товаров в онлайне!",
        image: "assets/intro_3.jpg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  curve: Curves.linearToEaseOut,
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 400),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 220 : 75,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? FlatButton(
                          child: Text(
                            "Приступить",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.route);
                          },
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
