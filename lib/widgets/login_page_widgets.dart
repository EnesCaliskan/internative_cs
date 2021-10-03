import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_cs/models/login.dart';
import 'package:internative_cs/models/signIn.dart';
import 'package:internative_cs/repository/signIn.dart';
import 'package:internative_cs/controller/tokenController.dart';

final Login login = Login();


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
    return Padding(
      padding: const EdgeInsets.only(left:40.0, right: 40.0, top: 10.0, bottom: 25.0),
      child: Observer(
        builder: (_) => TextField(
          controller: emailTextController,
          onChanged: (text){
            setState(() {
              _emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
              login.emailValid = _emailValid;
              login.email = text;
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
    return Padding(
      padding: const EdgeInsets.only(left:40.0, right: 40.0, top: 10.0, bottom: 30.0),
      child: Observer(
        builder: (_) => TextField(
          controller: passwordTextController,
          onChanged: (text){
            setState(() {
              _passwordValid = RegExp(r'(^(?:[+0]9)?[0-9]{1,12}$)').hasMatch(text);
              login.passwordValid = _passwordValid;
              login.password = text;
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
  String? token;

  @override
  Widget build(BuildContext context) {
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
      child: Observer(
        builder: (_) => TextButton(
          onPressed: (){
            if(login.emailValid && login.passwordValid){

              signIn(login.email, login.password).then((value){
                //print('value::' + value);
                setToken(value);
              });

              getToken().then((value){
                print('value:::' + value.toString());
                token = value;
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
      ),
    );
  }

}




