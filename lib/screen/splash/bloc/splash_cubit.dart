import 'package:ayna_chat_app/utils/hive_manage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState()) {
    checkIsLoggedIn();
  }

  checkIsLoggedIn() async {
    String? isUniqueId = HiveManage.instance.getString(key: HiveManage.keyUniqueId);
    await Future.delayed(const Duration(seconds: 3));
    if (isUniqueId != null && isUniqueId.isNotEmpty) {
      emit(state.copyWith(status: SplashStatus.home));
    } else {
      emit(state.copyWith(status: SplashStatus.login));
    }
  }
}
