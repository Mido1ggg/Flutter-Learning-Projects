import 'package:flutter/material.dart';
import 'package:list_view_proj/views/first_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return const MaterialApp(
       debugShowCheckedModeBanner: false,
       
       title: 'Login Screen',
       home: LoginScreen(),
     );
  }

}

