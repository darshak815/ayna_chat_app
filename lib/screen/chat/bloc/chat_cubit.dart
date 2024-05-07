import 'package:ayna_chat_app/model/chat_model.dart';
import 'package:ayna_chat_app/model/user_model.dart';
import 'package:ayna_chat_app/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../utils/hive_manage.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());
  String? userId = "";
  String node = "";
  WebSocketChannel? channel;

  loadData(UserModel model, ScrollController controllerList) async {
    String? userId = HiveManage.instance.getString(key: HiveManage.keyUniqueId);

    if (int.parse(userId ?? '0') > int.parse(model.userId)) {
      node = "${userId!}_${model.userId}";
    } else {
      node = "${model.userId}_${userId!}";
    }

    List<ChatModel> userList = List<ChatModel>.from(HiveManage.instance.getList(key: node) ?? []);
    emit(state.copyWith(messageList: userList, status: ChatStatus.success));
    bool isAvailable = await AppUtils().checkInternet();
    if (!isAvailable) {
      AppUtils().toastMessage("Internet connection problem.");
    }
    channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'));
    await channel!.ready;
    bool isEntry = false;
    channel!.stream.listen((message) {
      debugPrint("---4444-->$message");
      if (isEntry) {
        ChatModel model = ChatModel();
        model.receiver = "1";
        model.message = message;
        model.userId = model.userId;
        model.sender = "";
        state.messageList!.addAll([model]);
        HiveManage.instance.putList(key: node, value: state.messageList!);
        emit(state.copyWith(messageList: state.messageList!, status: ChatStatus.success));
        scrollDown(controllerList, isWait: true);
      } else {
        isEntry = true;
        scrollDown(controllerList);
      }
    });
  }

  sendMessage(ScrollController controllerList) async {
    if (AppUtils().isEmptyField(state.controllerMessage?.text)) {
      AppUtils().toastMessage("Please message type");
    } else {
      bool isAvailable = await AppUtils().checkInternet();
      if (!isAvailable) {
        AppUtils().toastMessage("Internet connection problem.");
      }
      ChatModel model = ChatModel();
      model.receiver = "";
      model.message = state.controllerMessage?.text.trim() ?? '';
      model.userId = userId ?? '';
      model.sender = "1";
      state.messageList!.addAll([model]);
      HiveManage.instance.putList(key: node, value: state.messageList!);
      channel!.sink.add(state.controllerMessage?.text.trim() ?? '');
      emit(state.copyWith(messageList: state.messageList!, status: ChatStatus.success));
      state.controllerMessage?.text = "";
      scrollDown(controllerList);
    }
  }

  void messageFill(TextEditingController textEditingController) {
    emit(state.copyWith(controllerMessage: textEditingController));
  }

  Future<void> scrollDown(ScrollController controllerList, {bool isWait = false}) async {
    debugPrint("0000");
    if (isWait) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    if (controllerList.hasClients) controllerList.jumpTo(controllerList.position.maxScrollExtent);
  }
}
