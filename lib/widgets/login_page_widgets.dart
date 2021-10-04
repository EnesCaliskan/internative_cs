import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_cs/db/Boxes.dart';
import 'package:internative_cs/db/token.dart';
import 'package:internative_cs/providers/login_provider.dart';
import 'package:internative_cs/repository/signIn.dart';
import 'package:provider/provider.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0, bottom: 20.0, left: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Text(
              'Please enter your email and password',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class EmailTextField extends StatefulWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final emailTextController = TextEditingController();
  bool _emailValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left:40.0, right: 40.0, top: 10.0, bottom: 25.0),
      child: TextField(
          controller: emailTextController,
          onChanged: (text){
            setState(() {
              _emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
              loginProvider.setEmailValid(_emailValid);
              loginProvider.setEmail(text);
            });
          },
          decoration: InputDecoration(
            helperText: _emailValid ? '' : 'Email is not valid',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 1.5,
                color: _emailValid ? Colors.green : Colors.red,
              ),
            ),
            labelText: 'Email',
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final passwordTextController = TextEditingController();
  bool _isObscure = true;
  bool _passwordValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left:40.0, right: 40.0, top: 10.0, bottom: 30.0),
      child: TextField(
          controller: passwordTextController,
          onChanged: (text){
            setState(() {
              _passwordValid = RegExp(r'(^(?:[+0]9)?[0-9]{1,12}$)').hasMatch(text);
              loginProvider.setPasswordValid(_passwordValid);
              loginProvider.setPassword(text);
            });
          },
          obscureText: _isObscure,
          decoration: InputDecoration(
              helperText: _passwordValid ? '' : 'Password must only contain numbers',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: _passwordValid ? Colors.green : Colors.red,
                    width: 1.5,
                ),
              ),
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
              onPressed: (){
              setState(() {
                _isObscure = !_isObscure;
              });
              },
            )
          ),
        ),
      );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  Future addToken(String tokenValue) async {
    final token = Token()
        ..tokenValue = tokenValue;

    final box = Boxes.getToken();
    box.add(token);
  }

  final myBox = Boxes.getToken();
  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.indigo),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.indigoAccent,
            offset: Offset(10.0, 10.0),
          )
        ],
      ),
      child: TextButton(
          onPressed: (){
            if(loginProvider.emailValid && loginProvider.passwordValid){

              signIn(loginProvider.email, loginProvider.password).then((value){
                addToken(value);
                loginProvider.setToken(value);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Login Successful'),
                ),
              );
              Navigator.pushNamed(context, '/home');
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text('Invalid email or password'),
                ),
              );
              }
            },
          child: Text(
              'Login',
              style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
  }

}




