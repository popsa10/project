
import 'package:flutter/material.dart';
import 'package:project/shared/ComponentButton.dart';

class PermissionsScreen extends StatefulWidget {
  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool statusAddEmployee = false;
  bool statusAddProject = false;
  bool statusEditProject = true;
  bool statusDeleteProject = true;
  bool statusViewProject = true;
  bool statusVehicals = false;
  bool statusReports = false;

  int group1Value;
  int group2Value;
  int groupEditVehicles;
  int groupRemoveVehicles;
  int groupAssignVehicles;
  int groupAddVehicles;
  int groupEditReports;
  int groupRemoveReports;
  int groupViewReports;
  int groupAddReports;
  int groupAddTasks;
  int groupEditTasks;
  int groupChangeTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Employee",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AddEmployee",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddEmployee,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddEmployee = value;
                        });
                      }),
                ],
              ),

              Text(
                "Edit Employee",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: group1Value,
                          onChanged: (value) {
                            setState(() {
                              group1Value = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: group1Value,
                          onChanged: (value) {
                            setState(() {
                              group1Value = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: group1Value,
                          onChanged: (value) {
                            setState(() {
                              group1Value = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Text(
                "Edit Employee",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: group2Value,
                          onChanged: (value) {
                            setState(() {
                              group2Value = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: group2Value,
                          onChanged: (value) {
                            setState(() {
                              group2Value = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: group2Value,
                          onChanged: (value) {
                            setState(() {
                              group2Value = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Projects",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AddProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusAddProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusAddProject = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EditProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusEditProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusEditProject = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DeleteProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusDeleteProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusDeleteProject = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ViewProject",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusViewProject,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusViewProject = value;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),

              //////////////////////////////////// add vehicals   /// / /
              Text(
                "Vehicles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Vehicals",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: statusVehicals,
                      onChanged: (value) {
                        print("VALUE : $value");
                        setState(() {
                          statusVehicals = value;
                        });
                      }),
                ],
              ),
              //  circleSelect(group: groupEditVehicles, text: "Edit Vehicles"),
              Text(
                "Edit Vehicles",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupEditVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupEditVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupEditVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupEditVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupEditVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupEditVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // circleSelect(group: groupRemoveVehicles, text: "Remove Vehicles"),
              Text(
                "Remove Vehicles",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupRemoveVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupRemoveVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupRemoveVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupRemoveVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupRemoveVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupRemoveVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //  circleSelect(group: groupAssignVehicles, text: "Assign Vehicles"),
              Text(
                "Assign Vehicles",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAssignVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupAssignVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAssignVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupAssignVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupAssignVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupAssignVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //   circleSelect(group: groupAddVehicles, text: "Add Vehicles"),
              Text(
                "Add Vehicles",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAddVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupAddVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAddVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupAddVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupAddVehicles,
                          onChanged: (value) {
                            setState(() {
                              groupAddVehicles = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 6,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 8,
              ),
              ///////////////////////////// add Report  /////////////////

              Text(
                "Reports",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Reports",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              //  circleSelect(group: groupEditReports, text: "Edit Vehicles"),
              Text(
                "Add Reports",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAddReports,
                          onChanged: (value) {
                            setState(() {
                              groupAddReports = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAddReports,
                          onChanged: (value) {
                            setState(() {
                              groupAddReports = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupAddReports,
                          onChanged: (value) {
                            setState(() {
                              groupAddReports = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // circleSelect(group: groupRemoveVehicles, text: "Remove Vehicles"),
              Text(
                "Edit Reports",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupEditReports,
                          onChanged: (value) {
                            setState(() {
                              groupEditReports = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupEditReports,
                          onChanged: (value) {
                            setState(() {
                              groupEditReports = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupEditReports,
                          onChanged: (value) {
                            setState(() {
                              groupEditReports = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //  circleSelect(group: groupAssignVehicles, text: "Assign Vehicles"),
              Text(
                "Delete Reports",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupRemoveReports,
                          onChanged: (value) {
                            setState(() {
                              groupRemoveReports = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupRemoveReports,
                          onChanged: (value) {
                            setState(() {
                              groupRemoveReports = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupRemoveReports,
                          onChanged: (value) {
                            setState(() {
                              groupRemoveReports = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //   circleSelect(group: groupAddVehicles, text: "Add Vehicles"),
              Text(
                "View Reports",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupViewReports,
                          onChanged: (value) {
                            setState(() {
                              groupViewReports = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupViewReports,
                          onChanged: (value) {
                            setState(() {
                              groupViewReports = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupViewReports,
                          onChanged: (value) {
                            setState(() {
                              groupViewReports = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 6,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 8,
              ),

              //////////////////////////// add Tasks ////////////////////////
              Text(
                "Tasks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Tasks",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              //  circleSelect(group: groupEditReports, text: "Edit Vehicles"),
              Text(
                "Add Tasks",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAddTasks,
                          onChanged: (value) {
                            setState(() {
                              groupAddTasks = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupAddTasks,
                          onChanged: (value) {
                            setState(() {
                              groupAddTasks = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupAddTasks,
                          onChanged: (value) {
                            setState(() {
                              groupAddTasks = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // circleSelect(group: groupRemoveVehicles, text: "Remove Vehicles"),
              Text(
                "Edit Tasks",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupEditTasks,
                          onChanged: (value) {
                            setState(() {
                              groupEditTasks = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupEditTasks,
                          onChanged: (value) {
                            setState(() {
                              groupEditTasks = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupEditTasks,
                          onChanged: (value) {
                            setState(() {
                              groupEditTasks = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //  circleSelect(group: groupAssignVehicles, text: "Assign Vehicles"),
              Text(
                "Change Tasks Status",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //////// radio 1
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupChangeTasks,
                          onChanged: (value) {
                            setState(() {
                              groupChangeTasks = value;
                            });
                          },
                        ),
                        Text(
                          "all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  //////// radio 2
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          value: 2,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          groupValue: groupChangeTasks,
                          onChanged: (value) {
                            setState(() {
                              groupChangeTasks = value;
                            });
                          },
                        ),
                        Text(
                          "Sub Employee",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //////////// radio 3
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                          focusColor: Colors.red,
                          value: 3,
                          groupValue: groupChangeTasks,
                          onChanged: (value) {
                            setState(() {
                              groupChangeTasks = value;
                            });
                          },
                        ),
                        Text(
                          "None",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: defaultButton(
                    text: "Save Employee",
                    width: MediaQuery.of(context).size.width - 100,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget circleSelect({int group, String text}) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //////// radio 1
              Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                    Text(
                      "all",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              //////// radio 2
              Container(
                height: 20,
                child: Row(
                  children: [
                    Radio(
                      value: 2,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                    Text(
                      "Sub Employee",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //////////// radio 3
              Container(
                height: 20,
                child: Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.green),
                      focusColor: Colors.red,
                      value: 3,
                      groupValue: group,
                      onChanged: (value) {
                        setState(() {
                          group = value;
                        });
                      },
                    ),
                    Text(
                      "None",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}
