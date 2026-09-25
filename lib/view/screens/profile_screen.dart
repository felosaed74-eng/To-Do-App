import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/app_routes.dart';
import 'package:todo_app/data/model/user_model.dart';
import 'package:todo_app/view/widget/coustom_text_form_feild_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 var fullName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5F7FB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Color(0xffE8ECF5),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Icon(Icons.person, size: 100, color: Color(0xff3F51B5),),
            ),
            SizedBox(height: 20,),
            Text("Create Your Profile",style: TextStyle(
              fontSize: 20,
              fontWeight: .bold,
            ),
            ),
            SizedBox(height: 20,),
            CoustomTextFormFeild(
              label: "Full Name",
              controller: fullName,
              validator: (value) {
                if (value == null || value.isEmpty){
                  return "Enter your name";
                }
                return null;
              },
            ),
            SizedBox(height: 50,),
            MaterialButton(
              onPressed: () async {
                _showLoading();
                var userBox = Hive.box<UserModel>('User');
                await userBox
                .put("UserKey", UserModel(fullName: fullName.text),)
                .then((value) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(AppRoutes.home);
                })
                .catchError((error){ 
                  Navigator.of(context).pop();
                  _showError(error);   
                });
                
              }, 
              color: Color(0xff3F51B5),
              padding: EdgeInsets.all(10),
              minWidth: 300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              child: Text(
              "Create",
              style: TextStyle(
                fontSize: 20,
                fontWeight: .bold,
                color: Colors.white
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _showLoading() async{
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        content: Row(
          spacing: 20,
          children: [
            CircularProgressIndicator(),
             Text("Loading....",
             style: TextStyle(
              fontSize: 16,
              fontWeight: .w400,
             ),),
          ],
        ) ,
      );
    } 
  );
  }
  Future<void> _showError( String error) async{
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        title: const Text(
          "Error",
          style: TextStyle(
            fontSize: 20, 
            fontWeight: .bold,
            color: Colors.red
            ),),
        content: Text(error, style: TextStyle( fontSize: 16, fontWeight: .w600),),
        actions: [
          TextButton(
            child: const Text("Okay"),
            onPressed: (){
              Navigator.of(context).pop();
            },
            )
        ],
      );
    } 
  );
  }

}