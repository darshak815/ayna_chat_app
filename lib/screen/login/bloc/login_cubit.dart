import 'package:ayna_chat_app/route/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/hive_manage.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  emailFill(TextEditingController email) {
    emit(state.copyWith(controllerEmail: email));
  }

  passwordFill(TextEditingController password) {
    emit(state.copyWith(controllerPassword: password));
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
    } else {
      List<UserModel> userList = List<UserModel>.from(HiveManage.instance.getList(key: HiveManage.keyUsers) ?? []);
      bool isExist = false;
      int index = -1;
      for (int i = 0; i < userList.length; i++) {
        if (userList[i].email == state.controllerEmail!.text.trim()) {
          isExist = true;
          index = i;
          break;
        }
      }
      if (isExist && index != -1) {
        UserModel model = userList[index];
        if (model.password == state.controllerPassword!.text.trim()) {
          HiveManage.instance.putString(key: HiveManage.keyEmail, value: model.email);
          HiveManage.instance.putString(key: HiveManage.keyUniqueId, value: model.userId);
          AppUtils().toastMessage("User login successfully");
          Navigator.pushNamedAndRemoveUntil(context, AppPages.homeScreen, (route) => false);
        } else {
          AppUtils().toastMessage("Incorrect password");
        }
      } else {
        AppUtils().toastMessage("User not found.");
      }
    }
  }
}
