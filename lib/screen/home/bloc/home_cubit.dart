import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';
import '../../../utils/hive_manage.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  loadData() {
    List<UserModel> userList = List<UserModel>.from(HiveManage.instance.getList(key: HiveManage.keyUsers) ?? []);
    String? userId = HiveManage.instance.getString(key: HiveManage.keyUniqueId);
    if (userId != null) {
      userList = userList.where((e) => e.userId != userId).toList();
      emit(state.copyWith(userList: userList, status: HomeStatus.success));
    }
  }
}
