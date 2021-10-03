import 'package:mobx/mobx.dart';
part 'login.g.dart';

class Login = _Login with _$Login;

abstract class _Login with Store{
  @observable bool emailValid = false;

  @observable bool passwordValid = false;

  @observable String email = '';

  @observable String password = '';






}