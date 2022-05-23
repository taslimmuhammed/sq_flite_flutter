import 'package:flutter/cupertino.dart';
import 'package:sq_flite/Models/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database _db;

Future<void> initializeDataBase() async {
  _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
  });
}

void addStudent(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO student (name,age) VALUES (?, ?)', [value.name, value.age]);
  // Updatig the UI
  studentListNotifier.value.add(value);
  //Using  .Value becuase now studentList is an obejct of vlaueNotifier Class
  studentListNotifier.notifyListeners();
  getAllStudents();
}

// For Adding an element
Future<void> getAllStudents() async {
  final _values = await _db.rawQuery('SELECT * FROM student');
  print(_values);
  studentListNotifier.value.clear();

  // Forech return each student object in the form of studentModel
  _values.forEach((map) {
    final student = StudentModel.formMap(map);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  });
}

//For Deleting an Element
Future<void> deleteStudent(int id) async {
  getAllStudents();
}
