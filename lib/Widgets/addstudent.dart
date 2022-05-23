import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sq_flite/Models/data_model.dart';
import 'package:sq_flite/db/functions/db_functions.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({Key? key}) : super(key: key);
  final _namecontroller = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _namecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Name"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "age1"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonClicked();
              },
              icon: Icon(Icons.add),
              label: Text("Add Student"))
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    // print("Name: $_name, Age: $_age");
    final _student = StudentModel(
        name: _name, age: _age, id: DateTime.now().millisecondsSinceEpoch);
    addStudent(_student);
  }
}
