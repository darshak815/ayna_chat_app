
import 'package:hive/hive.dart';

class HiveManage {
  static String keyEmail = "key_email";
  static String keyPassword = "key_password";
  static String keyUniqueId = "key_unique_id";
  static String keyChatHistory = "key_chat_history";
  static String keyUsers = "key_users";

  static final HiveManage _singleton = HiveManage._internal();
  var box;

  static HiveManage get instance => _singleton;

  HiveManage._internal();

  hiveBoxName({String name = "ayna_box"}) async {
    box = await Hive.openBox(name);
  }

  putString({required String key, required String value}) {
    box.put(key, value);
  }

  getString({required String key}) {
    return box.get(key);
  }

  putDouble({required String key, required double value}) {
    box.put(key, value);
  }

  getDouble({required String key}) {
    return box.get(key);
  }

  putBool({required String key, required bool value}) {
    box.put(key, value);
  }

  getBool({required String key}) {
    return box.get(key);
  }

  putInt({required String key, required int value}) {
    box.put(key, value);
  }

  getInt({required String key}) {
    return box.get(key);
  }

  putList({required String key, required value}) {
    box.put(key, value);
  }

  getList({required String key}) {
    return box.get(key);
  }
}
