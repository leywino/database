import 'package:database/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _key = await studentDB.add(value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int key) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(key);
  // Text("Age : ${studentDB.get('name').where}")
  getAllStudents();
}

Future<void> WriteStudent(int index, edit) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.putAt(index, edit);
  getAllStudents();
}
