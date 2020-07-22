import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezal_version_two/UI/widgets/my_flat_button.dart';
import 'package:tezal_version_two/UI/widgets/screen_loading.dart';
import 'package:tezal_version_two/UI/widgets/show_error.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  static String route = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход или регистрация'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) showErrorDialog(context, state.message);
          if (state is AuthLogedIn) _listenLogedIn(context);
          //if (state is AuthNeedRegistration) _listenNeedRegist(context, state);
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) return ScreenLoading();

            return _buildDefault();
          },
        ),
      ),
    );
  }

  void _listenLogedIn(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildDefault() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.0),
            Text(
              'Войдите',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "через телефон",
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "пароль",
              ),
            ),
            SizedBox(height: 20.0),
            MyFlatButton(
              title: 'Продолжить',
              onClick: () => _onContinue(context),
            )
          ],
        ),
      ),
    );
  }

  void _onContinue(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;
    context.bloc<AuthBloc>().add(Login(username: username, password: password));
    Navigator.of(context).pushReplacementNamed(LoginScreen.route);
  }
}
