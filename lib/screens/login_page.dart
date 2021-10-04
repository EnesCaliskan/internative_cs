import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internative_cs/widgets/login_page_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PageTitle(),
              EmailTextField(),
              PasswordTextField(),
              LoginButton(),
            ],
          ),
        ],
      ),
    );
  }
}
