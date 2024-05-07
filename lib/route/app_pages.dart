import 'package:ayna_chat_app/model/routing_data.dart';
import 'package:ayna_chat_app/screen/login/view/login_screen.dart';
import 'package:ayna_chat_app/screen/signup/view/signup_screen.dart';
import 'package:ayna_chat_app/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../screen/chat/view/chat_screen.dart';
import '../screen/home/view/home_screen.dart';

extension StringExtensions on String {
  RoutingData get getRoutingData {
    var uri = Uri.parse(this);
    return RoutingData(route: uri.path, queryParameters: uri.queryParameters);
  }
}

class AppPages {
  static const initial = "/";
  static const login = "/login";
  static const signUp = "/sign_up";
  static const homeScreen = "/home_screen";
  static const chatScreen = "/chat_screen";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case AppPages.login:
      return _getPageRoute(const LoginScreen(), settings);
    case AppPages.signUp:
      return _getPageRoute(const SignupScreen(), settings);
    case AppPages.homeScreen:
      return _getPageRoute(const HomeScreen(), settings);
    case AppPages.chatScreen:
      debugPrint("settings-->${settings.arguments}");
      UserModel model = settings.arguments as UserModel;
      return _getPageRoute(ChatScreen(model: model), settings);
    default:
      return _getPageRoute(const SplashScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}
