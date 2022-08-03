import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d15_bloc_navigation/app_navigator.dart';
import 'package:flutter_d15_bloc_navigation/post_cubit.dart';
import 'package:flutter_d15_bloc_navigation/post_view.dart';

import 'nav_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavCubit>(create: (context) => NavCubit()),
          BlocProvider<PostBloc>(create: (context) => PostBloc()..add(LoadPostEvent())),
        ],
        child: const AppNavigator(),
      ),
    );
  }
}
