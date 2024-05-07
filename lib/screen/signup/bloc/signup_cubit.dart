import 'package:ayna_chat_app/model/user_model.dart';
import 'package:ayna_chat_app/utils/app_utils.dart';
import 'package:ayna_chat_app/utils/hive_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState());

  emailFill(TextEditingController email) {
    emit(state.copyWith(controllerEmail: email));
  }

  passwordFill(TextEditingController password) {
    emit(state.copyWith(controllerPassword: password));
  }

  passwordConfirmFill(TextEditingController password) {
    emit(state.copyWith(controllerConfirmPassword: password));
  }

  void validateField({required BuildContext context}) {
    if (AppUtils().isEmptyField(state.controllerEmail?.text.trim())) {
      AppUtils().toastMessage("Please provide email");
    } else if (!AppUtils().isValidEmail(state.controllerEmail!.text.trim())) {
      AppUtils().toastMessage("Please provide valid email");
    } else if (AppUtils().isEmptyField(state.controllerPassword?.text.trim())) {
      AppUtils().toastMessage("Please provide password");
    } else if (state.controllerPassword!.text.trim().length < 8) {
      AppUtils().toastMessage("Password atleast 8 character long");
    } else if (AppUtils().isEmptyField(state.controllerConfirmPassword?.text.trim())) {
      AppUtils().toastMessage("Please provide confirm password");
    } else if (state.controllerConfirmPassword!.text.trim().length < 8) {
      AppUtils().toastMessage("Confirm Password atleast 8 character long");
    } else if (state.controllerPassword!.text.trim() != state.controllerConfirmPassword!.text.trim()) {
      AppUtils().toastMessage("Password and confirm password not same");
    } else {
      List<UserModel> userList = List<UserModel>.from(HiveManage.instance.getList(key: HiveManage.keyUsers) ?? []);

      final user = UserModel();
      user.email = state.controllerEmail?.text.trim() ?? '';
      user.password = state.controllerPassword?.text.trim() ?? '';
      user.userId = "${AppUtils().uniqueNumber()}";

      if (userList.isEmpty) {
        List<UserModel> categoryList = [];
        categoryList.add(user);
        HiveManage.instance.putList(key: HiveManage.keyUsers, value: categoryList);
        AppUtils().toastMessage("User register successfully.");
        Navigator.pop(context);
      } else {
        bool isExist = false;
        for (int i = 0; i < userList.length; i++) {
          if (userList[i].email == state.controllerEmail!.text.trim()) {
            isExist = true;
            break;
          }
        }
        if (!isExist) {
          List<UserModel> tempUserList = [];
          tempUserList.addAll(userList);
          tempUserList.add(user);

          HiveManage.instance.putList(key: HiveManage.keyUsers, value: tempUserList);

          AppUtils().toastMessage("User register successfully.");
          Navigator.pop(context);
        } else {
          AppUtils().toastMessage("Email already exist.");
        }
      }
    }
  }
}
