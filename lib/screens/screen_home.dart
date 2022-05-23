import 'package:flutter/material.dart';
import 'package:sq_flite/Widgets/addstudent.dart';
import 'package:sq_flite/Widgets/list_student.dart';
import 'package:sq_flite/db/functions/db_functions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
          const Expanded(child: ListStudentContext()),
        ],
      )),
    );
  }
}
