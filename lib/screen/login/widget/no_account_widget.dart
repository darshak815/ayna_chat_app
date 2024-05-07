import 'package:ayna_chat_app/route/app_pages.dart';
import 'package:ayna_chat_app/utils/app_theme/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NoAccountWidget extends StatelessWidget {
  const NoAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "Don't have an account?",
            style: appTheme.textTheme.bodyMedium!,
          ),
          const TextSpan(text: " "),
          TextSpan(
              text: 'Signup',
              style: appTheme.textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, AppPages.signUp);
                }),
        ],
      ),
    );
  }
}
