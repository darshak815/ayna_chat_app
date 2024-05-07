import 'package:flutter/material.dart';

import '../../../model/chat_model.dart';
import '../../../utils/app_theme/app_style.dart';

class ReceiverMessageWidget extends StatelessWidget {
  final ChatModel model;

  const ReceiverMessageWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0, top: 2.0, bottom: 2.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            child: Container(
              color: Colors.blue.withOpacity(.5),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(model.message,
                    style: appTheme.textTheme.bodyMedium!.copyWith(
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
