import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_routes.dart';
import 'package:todo_app/view/screens/add_task_screen.dart';
import 'package:todo_app/view/screens/home_screen.dart';
import 'package:todo_app/view/screens/profile_screen.dart';
import 'data/model/user_model.dart';

void main() async{
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserModelAdapter());
  Hive.openBox<UserModel>('User');
  
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.adddTask, routes:{
        AppRoutes.profile:(context) => ProfileScreen(),
        AppRoutes.adddTask:(context) => AddTaskScreen(),
        AppRoutes.home:(context) => HomeScreen(),  

      }
    );
  }
}