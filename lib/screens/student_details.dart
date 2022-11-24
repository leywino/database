import 'package:database/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';

class ShowDetails extends StatelessWidget {
  var data;

  ShowDetails({super.key, this.data});
  // StudentModel? data;

  @override
  Widget build(BuildContext context) {
    // Details(data);
    return Scaffold(
      body: Column(children: [
        Text('name : ${data.name}'),
        Text('name : ${data.age}'),
        Text('name : ${data.place}'),
        Text('name : ${data.phone}'),
      ]),
    );
  }
}

// Future<StudentModel?> Details(index) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   if (index != null) {
//     final data = studentDB.getAt(index);
//     return data;
//   } else {
//     print('index is null');
//   }
// }
