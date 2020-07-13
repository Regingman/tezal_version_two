import 'package:first_time_screen/first_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezal_version_two/ui/screens/intro/intro_screen.dart';
import 'package:tezal_version_two/ui/screens/main/main_screen.dart';
import 'UI/widgets/splash_screen.dart';
import 'app_config.dart';
import 'data/repositories/repository.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [],
        child: MaterialApp(
          theme: getTheme(),
          home: FirstTimeScreen(
            loadingScreen: SplashScreen(),
            introScreen: MaterialPageRoute(
              builder: (context) => IntroScreen(),
            ),
            landingScreen: MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          ),
          routes: getRoutes(),
        ),
      ),
    );
  }
}
