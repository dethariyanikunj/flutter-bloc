import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: emailTextEditingController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'enter email',
                ),
                onChanged: (email) {
                  BlocProvider.of<LoginBloc>(
                    context,
                    listen: false,
                  ).add(
                    LoginEmailTextChangedEvent(
                      email,
                      passwordTextEditingController.text.toString(),
                    ),
                  );
                },
              ),
              // Through bloc builder
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginInvalidEmailState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              TextField(
                controller: passwordTextEditingController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  hintText: 'enter password',
                ),
                onChanged: (password) {
                  BlocProvider.of<LoginBloc>(
                    context,
                    listen: false,
                  ).add(
                    LoginPasswordTextChangedEvent(
                      emailTextEditingController.text.toString(),
                      password,
                    ),
                  );
                },
              ),
              // Through bloc selector
              BlocSelector<LoginBloc, LoginState, String>(
                selector: (state) {
                  if (state is LoginInvalidPasswordState) {
                    return state.errorMessage;
                  }
                  return '';
                },
                builder: (context, value) {
                  if (value.trim().isEmpty) return const SizedBox();
                  return Text(
                    value,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  );
                },
              ),
              // Through bloc selector
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginInvalidPasswordState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(
                          context,
                          listen: false,
                        ).add(
                          LoginButtonPressEvent(
                            emailTextEditingController.text,
                            passwordTextEditingController.text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state is LoginValidFieldsState
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      child: const Text('Login'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
