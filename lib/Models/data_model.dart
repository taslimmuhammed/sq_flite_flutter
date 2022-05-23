import 'package:flutter/cupertino.dart';

class StudentModel {
  int? id;
  final String age;

  final String name;

  StudentModel({required this.name, required this.age, this.id});

// "fromMap takes a map and returns in the form of StudentModel"
  static StudentModel formMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;

    return StudentModel(id: id, name: name, age: age);
  }
}
