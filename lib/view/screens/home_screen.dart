import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 60,),
            HeaderWidget(),
            TaskInfoDetails(numOfTasks: 12, numOfPending: 5, numOfDone: 7),
        
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {

  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffE8ECF5),
            borderRadius: BorderRadius.circular(100)
          ),
         child: Icon(Icons.person, size: 50, color: Color(0xff3F51B5),),
       ),
       Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min ,
        spacing: 10,
        children: [
           Text("Good Morning", style: TextStyle(
             fontSize: 16,
             fontWeight: .w400,
             color: Colors.grey
           ),
          ),
          Text("Felopateer", style: TextStyle(
             fontSize: 16,
             fontWeight: .bold,
             color: Colors.black
           ),
          ),
        ],
       ),
      ],
    );
  }
}

class TaskInfoDetails extends StatelessWidget {
  const TaskInfoDetails({
    super.key, 
    required this.numOfTasks, 
    required this.numOfPending, 
    required this.numOfDone,
    });

 final int numOfTasks;
 final int numOfPending;
 final int numOfDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xff3F51B5),
        borderRadius: BorderRadius.circular(12), 
      ),
      child: Row(
        mainAxisAlignment: .spaceAround,
        children: [
         item(numOfTasks, "Tasks"),
         item(numOfPending, "Pending"),
         item(numOfDone,"Done"),
        ],
      ),
    );
  }
  Widget item( int num, String des){
   return Column(
     spacing: 10,
     mainAxisSize: .min,
     children: [
        Text(
         num.toString(), 
          style: TextStyle( 
             fontSize: 24, 
             fontWeight: .bold, 
             color: Colors.white
            ),
          ),
        Text(
          des, 
          style: TextStyle( 
            fontSize: 16, 
            fontWeight: .bold, 
            color: Colors.white
          ),
        ),
      ],
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task
  });

  final TaskM task;

  @override
  Widget build(BuildContext context) {
    return Container() ;
  }
}
