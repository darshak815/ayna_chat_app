import 'package:ayna_chat_app/component/entry_field.dart';
import 'package:ayna_chat_app/screen/chat/bloc/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_state.dart';

class MessageFieldWidget extends StatelessWidget {
  const MessageFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
        bloc: context.read<ChatCubit>()..messageFill(TextEditingController()),
        builder: (context, state) {
          return EntryField(
            controller: state.controllerMessage!,
            hint: "Type here...",
            fillColor: Colors.grey.shade200,
            fieldType: FieldType.rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              context.read<ChatCubit>().messageFill(state.controllerMessage!);
            },
          );
        });
  }
}
