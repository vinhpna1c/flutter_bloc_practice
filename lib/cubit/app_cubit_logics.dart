import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit_states.dart';
import 'package:flutter_bloc_practice/pages/detail_page.dart';
import 'package:flutter_bloc_practice/pages/home_page.dart';
import 'package:flutter_bloc_practice/pages/welcome_page.dart';

class AppCubitsLogics extends StatefulWidget {
  const AppCubitsLogics({super.key});

  @override
  State<AppCubitsLogics> createState() => _AppCubitsLogicsState();
}

class _AppCubitsLogicsState extends State<AppCubitsLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          return HomePage();
        } else if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
