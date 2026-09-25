// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
 String title;
 String descripition;
 StatusTask status;
 int colorHex;
  TaskModel({
    required this.title,
    required this.descripition,
    required this.status,
    required this.colorHex,
  });

}


enum StatusTask {pending,done,}