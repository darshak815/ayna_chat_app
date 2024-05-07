import 'dart:io';

import 'package:ayna_chat_app/screen/login/widget/password_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_theme/app_style.dart';
import 'email_field_widget.dart';
import 'login_button_widget.dart';
import 'no_account_widget.dart';

class LoginManage extends StatelessWidget {
  const LoginManage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Login",
                      style: appTheme.textTheme.bodyMedium!.copyWith(
                        color: Colors.blue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const EmailFieldWidget(),
                  const SizedBox(height: 10),
                  const PasswordFieldWidget(),
                  const SizedBox(height: 50),
                  const LoginButtonWidget(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        const Center(child: NoAccountWidget()),
        const SizedBox(height: 10),
      ],
    );
  }
}
