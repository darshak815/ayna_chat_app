import 'dart:math';

import 'package:oktoast/oktoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppUtils {
  int uniqueNumber({int number = 10000}) {
    Random random = Random();
    int randomNumber = random.nextInt(number);
    return randomNumber;
  }

  bool isEmptyField(String? value) {
    if (value == null || (value.trim().isEmpty)) {
      return true;
    }
    return false;
  }

  bool isValidEmail(String value) {
    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return emailValid;
  }

  void toastMessage(String message) {
    showToast(message);
  }

  Future<bool> checkInternet() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      return true;
    }
    return false;
  }
}
