import 'package:ayna_chat_app/screen/chat/bloc/chat_cubit.dart';
import 'package:ayna_chat_app/screen/chat/widget/message_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageManage extends StatelessWidget {
  final ScrollController controllerList;

  const SendMessageManage({super.key, required this.controllerList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: MessageFieldWidget()),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            context.read<ChatCubit>().sendMessage(controllerList);
          },
          child: SizedBox(
            height: 50,
            width: 50,
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      "assets/images/ic_send.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
