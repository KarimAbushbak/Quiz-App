import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizie/core/resources/manager_colors.dart';
import 'package:quizie/core/resources/manager_font_sizes.dart';
import 'package:quizie/core/resources/manager_font_weight.dart';

import '../../../core/routes.dart';
import '../logic/splash_bloc.dart';
import '../logic/splash_event.dart';
import '../logic/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            Navigator.pushReplacementNamed(context, Routes.homeView);
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: ManagerColors.primaryColor,
            child: Center(
              child: Text(
                "Quiz App",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ManagerFontSizes.s40,
                  fontWeight: ManagerFontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
