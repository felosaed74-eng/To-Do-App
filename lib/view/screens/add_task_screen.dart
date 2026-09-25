import 'package:flutter/material.dart';
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
            CustomMaterialButton( onPressed: () {
              print("Title: ${titleTask.text}");
              print("Dev: ${desTask.text}");
              print("Status: $dropdownButtonValue");
              print("Color: $colorSelected ");

            }, text: "Save"),
          ],
        ),
      ),
    );
  }
}
