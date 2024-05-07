import 'package:ayna_chat_app/route/app_pages.dart';
import 'package:ayna_chat_app/screen/home/bloc/home_cubit.dart';
import 'package:ayna_chat_app/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_theme/app_style.dart';
import '../../../utils/hive_manage.dart';
import '../widget/home_manage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = HiveManage.instance.getString(key: HiveManage.keyEmail);
    String user = "";
    if (email != null && email.isNotEmpty) {
      user = "${email.split('@')[0]}'s ";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "$user Home",
          style: appTheme.textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              HiveManage.instance.putString(key: HiveManage.keyEmail, value: "");
              HiveManage.instance.putString(key: HiveManage.keyUniqueId, value: "");
              AppUtils().toastMessage("User logout successfully");
              Navigator.pushNamedAndRemoveUntil(context, AppPages.login, (route) => false);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.logout, color: Colors.white),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AppPages.signUp).then((value) {
            context.read<HomeCubit>().loadData();
          });
        },
      ),
      body: const SafeArea(
        child: HomeManage(),
      ),
    );
  }
}
