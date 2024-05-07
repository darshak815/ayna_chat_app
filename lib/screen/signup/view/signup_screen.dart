import 'package:ayna_chat_app/screen/signup/bloc/signup_cubit.dart';
import 'package:ayna_chat_app/screen/signup/widget/signup_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
          appBar: AppBar(),
          body: const SafeArea(
            child: SignupManage(),
          )),
    );
  }
}
