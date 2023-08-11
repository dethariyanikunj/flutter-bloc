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
                    LoginEmailTextChangedEvent(email),
                  );
                },
              ),
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
                    LoginPasswordTextChangedEvent(password),
                  );
                },
              ),
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
                        backgroundColor: state is LoginValidInfoState
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
