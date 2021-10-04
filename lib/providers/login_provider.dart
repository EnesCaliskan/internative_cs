

import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
  late bool _emailValid;
  late bool _passwordValid;
  late String _email;
  late String _password;
  late String _token;

  LoginProvider(){
    _emailValid = false;
    _passwordValid = false;
    _email = '';
    _password = '';
    _token = '';
  }

  //getters
  bool get emailValid => _emailValid;
  bool get passwordValid => _passwordValid;
  String get email => _email;
  String get password => _password;
  String get token => _token;

  //setters
  void setEmailValid(bool emailValid){
    _emailValid = emailValid;
    notifyListeners();
  }

  void setPasswordValid(bool passwordValid){
    _passwordValid = passwordValid;
    notifyListeners();
  }

  void setEmail(String email){
    _email = email;
    notifyListeners();
  }

  void setPassword(String password){
    _password = password;
    notifyListeners();
  }

  void setToken(String token){
    _token = token;
    notifyListeners();
  }


}

