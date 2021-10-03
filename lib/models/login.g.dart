// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Login on _Login, Store {
  final _$emailValidAtom = Atom(name: '_Login.emailValid');

  @override
  bool get emailValid {
    _$emailValidAtom.reportRead();
    return super.emailValid;
  }

  @override
  set emailValid(bool value) {
    _$emailValidAtom.reportWrite(value, super.emailValid, () {
      super.emailValid = value;
    });
  }

  final _$passwordValidAtom = Atom(name: '_Login.passwordValid');

  @override
  bool get passwordValid {
    _$passwordValidAtom.reportRead();
    return super.passwordValid;
  }

  @override
  set passwordValid(bool value) {
    _$passwordValidAtom.reportWrite(value, super.passwordValid, () {
      super.passwordValid = value;
    });
  }

  final _$emailAtom = Atom(name: '_Login.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_Login.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
emailValid: ${emailValid},
passwordValid: ${passwordValid},
email: ${email},
password: ${password}
    ''';
  }
}
