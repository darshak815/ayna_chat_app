import 'package:ayna_chat_app/model/user_model.dart';

enum HomeStatus { initial, success, failed }

class HomeState {
  const HomeState({
    this.status = HomeStatus.initial,
    this.userList = const [],
  });

  final HomeStatus status;
  final List<UserModel>? userList;

  HomeState copyWith({
    HomeStatus? status,
    List<UserModel>? userList,
  }) {
    return HomeState(
      status: status ?? this.status,
      userList: userList ?? this.userList,
    );
  }
}
