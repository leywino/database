import 'package:database/screens/widgets/add_students.dart';
import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AddStudentsWidget(),
      ),
    );
  }
}
