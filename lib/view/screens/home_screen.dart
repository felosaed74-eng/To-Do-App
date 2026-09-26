import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_routes.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/data/model/user_model.dart';
import 'package:todo_app/view/widget/header_widget.dart';
import 'package:todo_app/view/widget/task_info_details_widget.dart';
import 'package:todo_app/view/widget/task_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = []; 
  int numOfTasks = 0;
  int numOfPending = 0;
  int numOfDone = 0;

  @override
  void initState() {
    super.initState();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 60,),
            HeaderWidget(fullName: getName(),),
            TaskInfoDetails(numOfTasks: numOfTasks, numOfPending: numOfPending, numOfDone: numOfDone),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => TaskItem(
                  task: tasks[index], 
                  delete: () {
                    deleteItem(index);
                },),
                itemCount: tasks.length,
                separatorBuilder: (context, index) => SizedBox(height: 10,),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:InkWell(
        onTap: () async {
          await Navigator.of(context).pushNamed(AppRoutes.addTask);
          getAllTasks();
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.white, 
          boxShadow: [BoxShadow(
            color: Colors.black.withAlpha(20), 
            offset: Offset(5, 5),
          ),],
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            spacing: 10,
              mainAxisSize: .min,
              children: [
                Icon(Icons.add, size: 30,),
                Text("Task"),
              ],
          ),
        ),
      ),
    );
  }
  void getAllTasks(){
    var taskBox = Hive.box<TaskModel>('Tasks');
    tasks = taskBox.values.toList();
    numbers();
    setState(() {});
  }

  String  getName () {
    var taskBox = Hive.box<UserModel>('User');
    var user = taskBox.get("UserKey");
    return user?.fullName ?? "Error From Name";
  }

  void numbers(){
    numOfTasks = tasks.length;
    numOfDone = tasks.where((e)=> e.status == StatusTask.done).toList().length;
    numOfPending = tasks.where((e)=> e.status == StatusTask.pending).toList().length;
  }

  void deleteItem (int index) {
  var taskBox = Hive.box<TaskModel>('Tasks');
   taskBox.deleteAt(index);
   tasks.removeAt(index);
   setState(() {});
  }
}
