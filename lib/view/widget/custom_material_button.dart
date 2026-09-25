import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.text
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff3F51B5),
      padding: EdgeInsets.all(10),
      minWidth: 300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: .bold,
        color: Colors.white
      ),
      ),
    );
  }
}