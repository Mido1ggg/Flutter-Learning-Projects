import 'package:flutter/material.dart';

Widget buildTextButton({
  Color backgroundColor = Colors.white,
  required VoidCallback onTap ,
  required Color textColor,
  required String text,
  double width = 321,
  double height = 40,

}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ),
      ));
}