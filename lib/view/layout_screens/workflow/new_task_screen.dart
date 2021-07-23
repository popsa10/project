import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({Key key}) : super(key: key);
  final TextEditingController taskName = TextEditingController();
  final TextEditingController assignedEmployees = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(title: "New Task", search: false),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              customTextField(
                controller: taskName,
                label: "Task Name",
                hintText: "Task Name",
                keyboardType: TextInputType.text,
              ),
              customTextField(
                controller: assignedEmployees,
                label: "Assigned Employees(multiple)",
                hintText: "Assigned Employees",
                keyboardType: TextInputType.text,
              ),
              customTextField(
                controller: startDate,
                label: "Start Date",
                hintText: "Start Date",
                keyboardType: TextInputType.datetime,
              ),
              customTextField(
                controller: endDate,
                label: "End Date",
                hintText: "End Date",
                keyboardType: TextInputType.datetime,
              ),
              customTextField(
                  controller: description,
                  label: "Description",
                  hintText: "Description",
                  keyboardType: TextInputType.text,
                  maxLines: 5),
              SizedBox(
                height: 3.h,
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
