import 'package:ayna_chat_app/screen/login/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/rounded_button.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      title: "Login",
      onPressed: () {
        context.read<LoginCubit>().validateField(context: context);
      },
    );
  }
}
