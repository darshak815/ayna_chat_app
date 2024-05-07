import 'package:ayna_chat_app/screen/signup/bloc/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/rounded_button.dart';

class SignupButtonWidget extends StatelessWidget {
  final String? title;

  const SignupButtonWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      title: title ?? "Signup",
      onPressed: () {
        context.read<SignupCubit>().validateField(
              context: context,
            );
      },
    );
  }
}
