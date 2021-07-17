import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/defaults.dart';
import 'package:sizer/sizer.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: customAppbar(title: "New Task", context: context, search: false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              newTaskField(
                label: "Task Name",
                validate: () {},
                hintText: "Task Name",
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              newTaskField(
                label: "Assigned Employees(multiple)",
                validate: () {},
                hintText: "Assigned Employees",
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              newTaskField(
                label: "Start Date",
                validate: () {},
                hintText: "Start Date",
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(
                height: 3.h,
              ),
              newTaskField(
                label: "End Date",
                validate: () {},
                hintText: "End Date",
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(
                height: 3.h,
              ),
              newTaskField(
                  label: "Description",
                  validate: () {},
                  hintText: "Description",
                  keyboardType: TextInputType.text,
                  maxLines: 5),
              SizedBox(
                height: 10.h,
              ),
              defaultButton(
                  text: "Create New Task",
                  onPressed: () {},
                  color: kPrimaryColor)
            ],
          ),
        ),
      ),
    ));
  }
}

Widget newTaskField(
        {
        //required TextEditingController controller,
        required TextInputType keyboardType,
        Function? validate,
        required String label,
        required String hintText,
        int maxLines = 1}) =>
    TextFormField(
        //controller: controller,
        keyboardType: keyboardType,
        validator: (val) {
          validate!();
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          alignLabelWithHint: false,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));
