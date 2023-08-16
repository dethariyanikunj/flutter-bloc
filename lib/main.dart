import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import './products/bloc/products_list_bloc.dart';
// import './products/products_with_bloc.dart';

// import './products/cubit/products_cubit.dart';
// import './products/products_with_cubit.dart';

// import './internet_bloc_cubit/cubit_home.dart';
// import './internet_bloc_cubit/bloc_home.dart';

import './login/login.dart';
import './login/bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*home: BlocProvider(
        create: (_) => ProductsListBloc(),
        child: const ProductsWithBloc(),
      ),*/
      /*home: BlocProvider(
        create: (_) => ProductsCubit(),
        child: const ProductsWithCubit(),
      ),*/
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: Login(),
      ),
      // home: const BlocHome(),
      // home: const CubitHome(),
    );
  }
}
