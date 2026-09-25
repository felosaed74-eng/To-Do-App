// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
 @HiveField(0)
 String title;
 @HiveField(1)
 String descripition;
 @HiveField(2)
 StatusTask status;
 @HiveField(3)
 int colorHex;
  TaskModel({
    required this.title,
    required this.descripition,
    required this.status,
    required this.colorHex,
  });

}

@HiveType(typeId: 2)
enum StatusTask {
  @HiveField(0)
  pending,
  @HiveField(1)
  done,
}