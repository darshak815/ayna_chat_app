import 'package:flutter/material.dart';

import '../utils/app_theme/app_style.dart';

enum FieldType {
  line,
  rounded,
}

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final GestureTapCallback? onTap;
  final TextCapitalization? textCapitalization;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final FormFieldSetter<String>? onSaved;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final FieldType fieldType;
  final Color? fillColor;

  //final String obscuringCharacter;

  const EntryField({
    super.key,
    this.label,
    this.controller,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.border,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.textCapitalization,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.onSaved,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.fieldType = FieldType.line,
    this.fillColor,
    //this.obscuringCharacter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        cursorColor: Colors.blue,
        onTap: onTap,
        obscureText: obscureText,
        autofocus: false,
        controller: controller,
        initialValue: initialValue,
        textInputAction: textInputAction,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        minLines: 1,
        maxLength: maxLength,
        maxLines: obscureText ? 1 : maxLines,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        onChanged: onChanged,
        onSaved: onSaved,
        style: appTheme.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w400,
          inherit: true,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
          hintStyle: appTheme.textTheme.bodyMedium!.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            inherit: true,
          ),
          filled: fieldType == FieldType.rounded ? true : false,
          fillColor: fieldType == FieldType.rounded ? fillColor : null,
          suffixIconConstraints: const BoxConstraints(
            maxWidth: 22.0,
            maxHeight: 22.0,
            minHeight: 22.0,
            minWidth: 22.0,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 40.0,
            maxHeight: 24.0,
            minHeight: 24.0,
            minWidth: 40.0,
          ),
          suffixIcon: (suffixIcon != null) ? suffixIcon : null,
          prefixIcon: (prefixIcon != null) ? prefixIcon : null,
          labelText: label,
          hintText: hint,
          border: fieldType == FieldType.rounded
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(360.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                )
              : border,
          errorText: errorText,
          counter: const Offstage(),
          icon: null,
        ));
  }
}
