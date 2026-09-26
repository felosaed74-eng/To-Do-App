import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {

  const HeaderWidget({super.key, required this.fullName});
  final String fullName;
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
          Text(fullName, style: TextStyle(
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

