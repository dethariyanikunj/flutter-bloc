import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './internet_bloc/internet_bloc.dart';

class BlocHome extends StatelessWidget {
  const BlocHome({Key? key}) : super(key: key);

  Widget showMessage(String message) {
    return Text(message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: showMessage('Internet Connected!'),
                  ),
                );
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: showMessage('Internet Lost!'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: showMessage('Loading Internet...'),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return showMessage('Internet Connected!');
              } else if (state is InternetLostState) {
                return showMessage('Internet Lost!');
              }
              return showMessage('Loading Internet...');
            },
          ),
        ),
      ),
    );
  }
}
