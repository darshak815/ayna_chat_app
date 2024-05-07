import 'package:ayna_chat_app/component/entry_field.dart';
import 'package:ayna_chat_app/screen/login/bloc/login_cubit.dart';
import 'package:ayna_chat_app/screen/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordFieldWidget extends StatelessWidget {
  const NewPasswordFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        bloc: context.read<LoginCubit>()..passwordFill(TextEditingController()),
        builder: (context, state) {
          return EntryField(
            controller: state.controllerPassword!,
            hint: "Password",
            fillColor: Colors.grey.shade200,
            fieldType: FieldType.rounded,
            keyboardType: TextInputType.text,
            obscureText: true,
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              context.read<LoginCubit>().passwordFill(state.controllerPassword!);
            },
          );
        });
  }
}
