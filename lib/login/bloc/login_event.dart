part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginEmailTextChangedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginEmailTextChangedEvent(this.email, this.password);
}

class LoginPasswordTextChangedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginPasswordTextChangedEvent(this.email, this.password);
}

class LoginButtonPressEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressEvent(this.email, this.password);
}
