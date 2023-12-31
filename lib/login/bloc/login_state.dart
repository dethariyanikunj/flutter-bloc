part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidEmailState extends LoginState {}

class LoginValidPasswordState extends LoginState {}

class LoginValidFieldsState extends LoginState {}

class LoginInvalidEmailState extends LoginState {
  final String errorMessage;

  LoginInvalidEmailState(this.errorMessage);
}

class LoginInvalidPasswordState extends LoginState {
  final String errorMessage;

  LoginInvalidPasswordState(this.errorMessage);
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}
