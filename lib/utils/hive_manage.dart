import 'dart:ffi';

import 'package:hive/hive.dart';

class HiveManage {
  static final HiveManage _singleton = HiveManage._internal();
  var box;

  factory HiveManage() {
    return _singleton;
  }

  HiveManage._internal();

  hiveBoxName({String name = "ayna_box"}) async {
    box = Hive.box(name);
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

  putFloat({required String key, required Float value}) {
    box.put(key, value);
  }

  getFloat({required String key}) {
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
}
