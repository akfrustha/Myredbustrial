import 'package:flutter/material.dart';
import 'package:myredbustrial/student.dart';
import 'package:myredbustrial/auma.dart';
//import 'loginscreen.dart';
//mport 'package:myredbustrial/student.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //return LoginScreen();
   // return StudentPage();
    return StudentPage();
  }
}