import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';
import '../../../utils/app_theme/app_style.dart';
import '../bloc/chat_cubit.dart';
import '../widget/chat_manage.dart';

class ChatScreen extends StatelessWidget {
  final UserModel model;

  const ChatScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            model.email.split("@")[0],
            style: appTheme.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: ChatManage(model: model),
          ),
        ),
      ),
    );
  }
}
