import 'package:first_time_screen/first_time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezal_version_two/UI/screens/login/login_screen.dart';
import 'package:tezal_version_two/UI/widgets/layout.dart';
import 'package:tezal_version_two/blocs/auth_bloc/auth_bloc.dart';
import 'package:tezal_version_two/blocs/home_bloc/home_bloc.dart';
import 'UI/widgets/splash_screen.dart';
import 'app_config.dart';
import 'blocs/registration_bloc/registration_bloc.dart';
import 'data/repositories/repository.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    clear();
    return RepositoryProvider(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RegistrationBloc(context.repository<Repository>()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(context.repository<Repository>()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(context.repository<Repository>()),
          ),
        ],
        child: MaterialApp(
          theme: getTheme(),
          home: FirstTimeScreen(
            loadingScreen: SplashScreen(),
            introScreen: MaterialPageRoute(
              builder: (context) => Landing(),
            ),
            landingScreen: MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          ),
          routes: getRoutes(),
        ),
      ),
    );
  }

  clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
