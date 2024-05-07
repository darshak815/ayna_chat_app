import 'package:flutter/material.dart';

import '../utils/app_theme/app_style.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Color fillColor;
  final Color titleTextColor;
  final Color borderColor;
  final VoidCallback? onPressed;

  const RoundedButton({
    Key? key,
    required this.title,
    this.fillColor = Colors.blue,
    this.titleTextColor = Colors.white,
    this.borderColor = Colors.blue,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor: MaterialStateProperty.all<Color>(fillColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360),
                side: BorderSide(
                  color: borderColor,
                  width: 1.0,
                )))),
        onPressed: onPressed,
        child: Text(title,
            style: appTheme.textTheme.bodySmall!.copyWith(
              color: titleTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
      ),
    );
  }
}
