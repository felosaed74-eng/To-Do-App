import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_dialog.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/view/widget/choose_color_widget.dart';
import 'package:todo_app/view/widget/custom_material_button.dart';
import 'package:todo_app/view/widget/custom_text_form_feild_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen ({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? dropdownButtonValue = "Pending";
  var titleTask = TextEditingController();
  var desTask = TextEditingController();
  int colorSelected = 4280391411;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Task",
          style:  TextStyle(fontSize: 24,fontWeight: .bold,),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CoustomTextFormFeild(
              label: "Title Task", 
              hint: "Enter task title", 
              controller: titleTask,), 
            CoustomTextFormFeild(
              label: "Description Task", 
              hint: "Enter task title", 
              maxLines: 4, 
              controller: desTask,),
            SizedBox(height: 10,),
            Text( "Status", style: TextStyle(fontSize: 16,fontWeight: .bold,)),
            DropdownButton(
              value: dropdownButtonValue,
              icon: Icon(Icons.arrow_downward),
              elevation: 16,    
                items: [
                  DropdownMenuItem(
                      value: "Pending",
                      child: Text(
                        "Pending", style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500, 
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                      value: "Done",
                       child: Text(
                        "Done", style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500, 
                      ),
                      ),
                    ),    
                ], 
               onChanged: (value){
                    dropdownButtonValue =value ?? "Pending";
                    setState(() {});
                  }
            ),
            SizedBox(height: 20,),
            ChooseColorWidget(
             clickColor: (color) {
               print(color.toString());
               colorSelected = color;
              },
            ),
            SizedBox(height: 20,),
            CustomMaterialButton( 
              onPressed: () async {
              log("Title: ${titleTask.text}");
              log("Dev: ${desTask.text}");
              log("Status: $dropdownButtonValue");
              log("Color: $colorSelected ");
              AppDialog.showLoading(context);
              var taskBox = Hive.box<TaskModel>("Tasks");
              await taskBox.add(TaskModel(
                title: titleTask.text, 
                descripition: desTask.text,  
                status: dropdownButtonValue == "Pending" ? 
                .pending : 
                .done, 
                colorHex: colorSelected,
                ),
              )
              .then((value){
                Navigator.of(context).pop();
                titleTask.clear();
                desTask.clear();
                colorSelected = 4280391411;

              })
              .catchError((error){
                Navigator.of(context).pop();
                AppDialog.showError(context, error);
              });
            },
             text: "Save"),
          ],
        ),
      ),
    );
  }
}
