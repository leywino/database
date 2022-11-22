import 'package:database/db/functions/db_functions.dart';
import 'package:database/db/model/data_model.dart';
import 'package:flutter/material.dart';

class StudentsNav extends StatelessWidget {
  const StudentsNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) {
            final data = studentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.place),
            );
          },
        );
      },
    );
  }
}
