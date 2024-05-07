import 'package:flutter/material.dart';

import '../../../model/chat_model.dart';
import '../../../utils/app_theme/app_style.dart';

class SenderMessageWidget extends StatelessWidget {
  final ChatModel model;

  const SenderMessageWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 50, bottom: 2.0),
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: Container(
              color: Colors.grey.withOpacity(.5),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(model.message,
                    style: appTheme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
