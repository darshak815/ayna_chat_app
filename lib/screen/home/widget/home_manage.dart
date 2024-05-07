import 'package:ayna_chat_app/model/user_model.dart';
import 'package:ayna_chat_app/route/app_pages.dart';
import 'package:ayna_chat_app/screen/home/bloc/home_cubit.dart';
import 'package:ayna_chat_app/screen/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_theme/app_style.dart';

class HomeManage extends StatelessWidget {
  const HomeManage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: context.read<HomeCubit>()..loadData(),
        builder: (context, state) {
          debugPrint("state.status--->${state.status}-->${(state.userList ?? []).length}");
          if (state.status == HomeStatus.success) {
            return Column(
              children: [
                Expanded(
                  child: (state.userList ?? []).isNotEmpty?ListView.builder(
                      itemCount: (state.userList ?? []).length,
                      itemBuilder: (context, index) {
                        UserModel model = state.userList![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppPages.chatScreen, arguments: model);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const SizedBox(width: 5),
                                  Expanded(
                                      child: Text(
                                    model.email.split('@')[0],
                                    style: appTheme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 16,
                                    ),
                                  )),
                                  const Icon(
                                    Icons.navigate_next,
                                    size: 30,
                                  )
                                ],
                              ),
                            )),
                          ),
                        );
                      }):Center(
                      child: Text(
                        "No users found.",
                        style: appTheme.textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            );
          }
          return const SizedBox();
        });
  }
}
