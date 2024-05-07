import 'dart:io';

import 'package:ayna_chat_app/utils/hive_manage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_theme/app_style.dart';
import 'already_account_widget.dart';
import 'signup_c_password_field_widget.dart';
import 'signup_email_field_widget.dart';
import 'signup_button_widget.dart';
import 'signup_password_field_widget.dart';

class SignupManage extends StatelessWidget {
  const SignupManage({super.key});

  @override
  Widget build(BuildContext context) {
    String? userId = HiveManage.instance.getString(key: HiveManage.keyUniqueId);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: kIsWeb
                  ? 400
                  : (Platform.isMacOS || Platform.isWindows)
                      ? 400
                      : null,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                children: [
                  Center(
                    child: Text(
                      (userId == null||userId.isEmpty) ? "Signup" : "Add New User",
                      style: appTheme.textTheme.bodyMedium!.copyWith(
                        color: Colors.blue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const SignupEmailFieldWidget(),
                  const SizedBox(height: 10),
                  const SignupPasswordFieldWidget(),
                  const SizedBox(height: 10),
                  const SignupCPasswordFieldWidget(),
                  const SizedBox(height: 50),
                  SignupButtonWidget(
                    title: userId != null ? "Submit" : null,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        if (userId == null) const Center(child: AlreadyAccountWidget()),
        const SizedBox(height: 10),
      ],
    );
  }
}
