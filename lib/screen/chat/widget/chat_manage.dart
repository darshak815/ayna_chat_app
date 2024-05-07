import 'package:ayna_chat_app/model/chat_model.dart';
import 'package:ayna_chat_app/screen/chat/bloc/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';
import '../../../utils/app_theme/app_style.dart';
import '../bloc/chat_cubit.dart';
import 'receiver_message_widget.dart';
import 'send_message_manage.dart';
import 'sender_message_widget.dart';

class ChatManage extends StatelessWidget {
  final UserModel model;

  const ChatManage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerList = ScrollController();

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
              bloc: context.read<ChatCubit>()..loadData(model, controllerList),
              builder: (context, state) {
                if (state.status == ChatStatus.success) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            controller: controllerList,
                            itemCount: (state.messageList ?? []).length,
                            itemBuilder: (context, index) {
                              ChatModel model = state.messageList![index];
                              return model.sender == "1"
                                  ? SenderMessageWidget(
                                      model: model,
                                    )
                                  : ReceiverMessageWidget(
                                      model: model,
                                    );
                            }),
                      )
                    ],
                  );
                }
                return Center(
                    child: Text(
                  "Send your first message",
                  style: appTheme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ));
              }),
        ),
        SendMessageManage(controllerList: controllerList),
      ],
    );
  }
}
