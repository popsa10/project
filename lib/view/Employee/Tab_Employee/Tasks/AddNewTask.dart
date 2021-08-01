import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';
import '../../../../constants.dart';

class AddNewTaskScreen extends StatelessWidget {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController assignedEmployees = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                child: Scaffold(
                  appBar: CustomAppBar(title: " Add New Task", search: false),
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
                            height: 3.0,
                          ),
                          defaultButton(
                              text: "Create New Task",
                              onPressed: () {
                                AppCubit.get(context).addTasks(
                                    name: taskName.text,
                                    users: assignedEmployees.text,
                                    startdate: startDate.text,
                                    enddate: endDate.text,
                                    desription: description.text);
                              },
                              background: kPrimaryColor)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
