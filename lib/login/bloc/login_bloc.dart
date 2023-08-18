import 'package:block_example/login/utils/validation_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final validationUtils = ValidationUtils();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginEmailTextChangedEvent>(
      (event, emit) {
        if (validationUtils.isValidFields(event.email, event.password)) {
          emit(LoginValidFieldsState());
        } else if (validationUtils.isValidEmail(event.email)) {
          emit(LoginValidEmailState());
        } else {
          emit(LoginInvalidEmailState('Please enter valid email address'));
        }
      },
    );
    on<LoginPasswordTextChangedEvent>(
      (event, emit) {
        if (validationUtils.isValidFields(event.email, event.password)) {
          emit(LoginValidFieldsState());
        } else if (validationUtils.isValidPassword(event.password)) {
          emit(LoginValidPasswordState());
        } else {
          emit(LoginInvalidPasswordState('Please enter valid password'));
        }
      },
    );
    on<LoginButtonPressEvent>(
      (event, emit) {
        if (validationUtils.isValidFields(event.email, event.password)) {
          emit(LoginLoadingState());
        }
      },
    );
  }
}
