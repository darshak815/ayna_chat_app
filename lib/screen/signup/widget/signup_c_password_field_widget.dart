import 'package:ayna_chat_app/component/entry_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signup_cubit.dart';
import '../bloc/signup_state.dart';

class SignupCPasswordFieldWidget extends StatelessWidget {
  const SignupCPasswordFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
        bloc: context.read<SignupCubit>()..passwordConfirmFill(TextEditingController()),
        builder: (context, state) {
          return EntryField(
            controller: state.controllerConfirmPassword!,
            hint: "Confirm Password",
            fillColor: Colors.grey.shade200,
            fieldType: FieldType.rounded,
            keyboardType: TextInputType.text,
            obscureText: true,
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              context.read<SignupCubit>().passwordConfirmFill(state.controllerConfirmPassword!);
            },
          );
        });
  }
}
