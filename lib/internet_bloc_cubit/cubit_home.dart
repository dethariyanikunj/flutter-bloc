import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './internet_cubit/internet_cubit.dart';

class CubitHome extends StatelessWidget {
  const CubitHome({Key? key}) : super(key: key);

  Widget _showMessage(String message) {
    return Text(message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: _showMessage('Internet Gained!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: _showMessage('Internet Lost!'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: _showMessage('Internet Loading!'),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return _showMessage('Internet Gained!');
              } else if (state is InternetLostState) {
                return _showMessage('Internet Lost!');
              }
              return _showMessage('Internet Loading!');
            },
          ),
        ),
      ),
    );
  }
}
