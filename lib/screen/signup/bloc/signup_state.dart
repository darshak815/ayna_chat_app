import 'package:flutter/material.dart';

enum SignupStatus { initial, login, home }

class SignupState {
  const SignupState({
    this.status = SignupStatus.initial,
    this.controllerEmail,
    this.controllerConfirmPassword,
    this.controllerPassword,
  });

  final SignupStatus status;

  final TextEditingController? controllerEmail;
  final TextEditingController? controllerConfirmPassword;
  final TextEditingController? controllerPassword;

  SignupState copyWith({
    SignupStatus? status,
    TextEditingController? controllerEmail,
    TextEditingController? controllerConfirmPassword,
    TextEditingController? controllerPassword,
  }) {
    return SignupState(
      status: status ?? this.status,
      controllerEmail: controllerEmail ?? this.controllerEmail,
      controllerConfirmPassword: controllerConfirmPassword ?? this.controllerConfirmPassword,
      controllerPassword: controllerPassword ?? this.controllerPassword,
    );
  }
}
