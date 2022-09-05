import 'package:flutter/material.dart';
import 'package:internship_task/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Internship task',
       debugShowCheckedModeBanner: false, 
      home:  HomePg()
    );
  }
}
 
 
