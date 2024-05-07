import 'package:ayna_chat_app/route/app_pages.dart';
import 'package:ayna_chat_app/screen/splash/bloc/splash_cubit.dart';
import 'package:ayna_chat_app/screen/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.status == SplashStatus.home) {
            Navigator.pushNamedAndRemoveUntil(context, AppPages.homeScreen, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(context, AppPages.login, (route) => false);
          }
        },
        child: Scaffold(
            body: SafeArea(
          child: Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                "assets/images/ic_logo.png",
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
          ),
        )));
  }
}
