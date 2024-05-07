import 'package:flutter/cupertino.dart';

enum LoginStatus { initial, success, failed }

class LoginState {
  const LoginState({
    this.status = LoginStatus.initial,
    this.controllerEmail,
    this.controllerPassword,
  });

  final LoginStatus status;
  final TextEditingController? controllerEmail;
  final TextEditingController? controllerPassword;

  LoginState copyWith({
    LoginStatus? status,
    TextEditingController? controllerEmail,
    TextEditingController? controllerPassword,
  }) {
    return LoginState(
      status: status ?? this.status,
      controllerEmail: controllerEmail ?? this.controllerEmail,
      controllerPassword: controllerPassword ?? this.controllerPassword,
    );
  }
}
