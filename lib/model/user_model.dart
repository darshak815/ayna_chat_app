import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String userId = '';
  @HiveField(1)
  String email = '';
  @HiveField(2)
  String password = '';
  @HiveField(3)
  DateTime dateTime = DateTime.now();
}
