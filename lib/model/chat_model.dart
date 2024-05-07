import 'package:hive/hive.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 2)
class ChatModel extends HiveObject {
  @HiveField(0)
  String message = '';
  @HiveField(1)
  String sender = '';
  @HiveField(2)
  String receiver = '';
  @HiveField(3)
  String userId = '';
  @HiveField(4)
  DateTime dateTime = DateTime.now();
}
