import 'package:ayna_chat_app/utils/app_theme/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyAccountWidget extends StatelessWidget {
  const AlreadyAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "Already have an account?",
            style: appTheme.textTheme.bodyMedium!,
          ),
          const TextSpan(text: " "),
          TextSpan(
              text: 'Login',
              style: appTheme.textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                }),
        ],
      ),
    );
  }
}
