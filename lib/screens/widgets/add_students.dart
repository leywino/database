import 'package:database/db/functions/db_functions.dart';
import 'package:database/db/model/data_model.dart';
import 'package:flutter/material.dart';

class AddStudentsWidget extends StatelessWidget {
  AddStudentsWidget({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _placeController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Add Students',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 119, 118, 118),
                          width: 3.0),
                    ),
                    hintText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // ignore: prefer_const_constructors
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 119, 118, 118),
                          width: 3.0),
                    ),
                    hintText: 'Age',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _placeController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 119, 118, 118),
                          width: 3.0),
                    ),
                    hintText: 'Place',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 3.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 119, 118, 118),
                          width: 3.0),
                    ),
                    hintText: 'Phone Number',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    AddButton(context);
                  },
                  label: Text('Add'),
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AddButton(BuildContext ctx) {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _place = _placeController.text.trim();
    final _phone = _phoneController.text.trim();
    var field;

    ErrorMessage() {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[300],
          content: Row(
            children: [
              Icon(Icons.error),
              Text('$field is empty'),
            ],
          ),
        ),
      );
    }

    if (_name.isEmpty && _age.isEmpty && _place.isEmpty && _phone.isEmpty) {
      field = 'Every field';
      ErrorMessage();
    } else if (_name.isEmpty) {
      field = 'Name';
      ErrorMessage();
    } else if (_age.isEmpty) {
      field = 'Age';
      ErrorMessage();
    } else if (_place.isEmpty) {
      field = 'Place';
      ErrorMessage();
    } else if (_phone.isEmpty) {
      field = 'Phone number';
      ErrorMessage();
    } else {
      final _student =
          StudentModel(name: _name, age: _age, place: _place, phone: _phone);
      addStudent(_student);
    }
  }
}
