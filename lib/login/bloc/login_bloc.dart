import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEmailTextChangedEvent>(
      (event, emit) {
        if (_isValidEmail(event.email)) {
          emit(LoginValidInfoState());
        } else {
          emit(LoginInvalidEmailState('Please enter valid email address'));
        }
      },
    );
    on<LoginPasswordTextChangedEvent>(
      (event, emit) {
        if (_isValidPassword(event.pass)) {
          emit(LoginValidInfoState());
        } else {
          emit(LoginInvalidPasswordState('Please enter valid password'));
        }
      },
    );
    on<LoginButtonPressEvent>(
      (event, emit) {
        if (_isValidFields(event.email, event.password)) {
          emit(LoginLoadingState());
        }
      },
    );
  }

  bool _isValidFields(String email, String pass) {
    return _isValidEmail(email) && _isValidPassword(pass);
  }

  bool _isValidEmail(String email) {
    return email.isNotEmpty && email.contains('@');
  }

  bool _isValidPassword(String password) {
    return password.isNotEmpty && password.length >= 8;
  }
}
