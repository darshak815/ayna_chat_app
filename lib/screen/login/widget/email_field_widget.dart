import 'package:ayna_chat_app/component/entry_field.dart';
import 'package:ayna_chat_app/screen/login/bloc/login_cubit.dart';
import 'package:ayna_chat_app/screen/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        bloc: context.read<LoginCubit>()..emailFill(TextEditingController()),
        builder: (context, state) {
          return EntryField(
            controller: state.controllerEmail!,
            hint: "Email",
            fillColor: Colors.grey.shade200,
            fieldType: FieldType.rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              context.read<LoginCubit>().emailFill(state.controllerEmail!);
            },
          );
        });
  }
}
