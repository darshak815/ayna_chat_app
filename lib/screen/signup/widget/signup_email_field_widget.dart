import 'package:ayna_chat_app/component/entry_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signup_cubit.dart';
import '../bloc/signup_state.dart';

class SignupEmailFieldWidget extends StatelessWidget {
  const SignupEmailFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
        bloc: context.read<SignupCubit>()..emailFill(TextEditingController()),
        builder: (context, state) {
          return EntryField(
            controller: state.controllerEmail!,
            hint: "Email",
            fillColor: Colors.grey.shade200,
            fieldType: FieldType.rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              context.read<SignupCubit>().emailFill(state.controllerEmail!);
            },
          );
        });
  }
}
