part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginEmailTextChangedEvent extends LoginEvent {
  final String email;

  LoginEmailTextChangedEvent(this.email);
}

class LoginPasswordTextChangedEvent extends LoginEvent {
  final String pass;

  LoginPasswordTextChangedEvent(this.pass);
}

class LoginButtonPressEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressEvent(this.email, this.password);
}
