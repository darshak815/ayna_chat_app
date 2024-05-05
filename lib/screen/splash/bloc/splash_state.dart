enum SplashStatus { initial, login, home }

class SplashState {
  const SplashState({this.status = SplashStatus.initial, this.isLoggedIn = false});

  final SplashStatus status;
  final bool isLoggedIn;

  copyWith({SplashStatus? status, bool? isLoggedIn}) {
    status = status ?? this.status;
    isLoggedIn = isLoggedIn ?? this.isLoggedIn;
  }
}
