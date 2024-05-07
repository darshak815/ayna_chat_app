import 'package:flutter/cupertino.dart';

import '../../../model/chat_model.dart';

enum ChatStatus { initial, success, failed }

class ChatState {
  const ChatState({
    this.status = ChatStatus.initial,
    this.messageList = const [],
    this.controllerMessage,
  });

  final ChatStatus status;
  final List<ChatModel>? messageList;
  final TextEditingController? controllerMessage;

  ChatState copyWith({
    ChatStatus? status,
    List<ChatModel>? messageList,
    TextEditingController? controllerMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      messageList: messageList ?? this.messageList,
      controllerMessage: controllerMessage ?? this.controllerMessage,
    );
  }
}
