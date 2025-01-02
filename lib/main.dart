import 'package:flutter/material.dart';
import 'package:myapp/question_screen.dart';
import 'package:myapp/start_screen.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightGreen, Colors.lightBlue],
        ),
      ),
      child: const QuestionScreen()
    ),
  ),),);
}

