import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project/constants.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/model/location/all_location_model.dart';
import 'package:project/model/vehicle/vehicle_model.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';
import 'package:sizer/sizer.dart';

class CreateProjectScreen extends StatefulWidget {
  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final projectName = TextEditingController();

  final projectType = TextEditingController();

  final value = TextEditingController();

  final invoiceNo = TextEditingController();

  final invoiceValue = TextEditingController();

  final expectedDate = TextEditingController();

  final startDate = TextEditingController();

  final endDate = TextEditingController();

  final scheduleLink = TextEditingController();

  final deadline = TextEditingController();

  final contractLink = TextEditingController();

  final otherFile = TextEditingController();

  final notes = TextEditingController();

  List<Users> employeesList = [];

  List<Locations> locationsList = [];

  List<Vehicle> vehicleList = [];

  AppCubit appCubit = AppCubit();

  List<Users> employees;

  Users issuedTo;

  Users employee;

  Locations location;

  List<Vehicle> vehicles;

  Vehicle vehicle;

  List<Users> taskCreators;

  Users taskCreator;

  File projectImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmp();
    getLocations();
    AppCubit.get(context).getAllVehicles();
  }

  Future<void> getEmp() async {
    AllEmployeesModel allEmployeesModel = await appCubit.getEmployees();
    allEmployeesModel.users.forEach((element) {
      employeesList.add(element);
    });
    setState(() {});
  }

  Future<void> getLocations() async {
    AllLocationsModel allEmployeesModel = await appCubit.getLocations();
    allEmployeesModel.locations.forEach((element) {
      locationsList.add(element);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Create Project",
        search: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create New Project",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              SizedBox(
                height: 1.h,
              ),
              customTextField(
                  hintText: "Project Name",
                  label: "Project Name",
                  controller: projectName,
                  keyboardType: TextInputType.name),
              customTextField(
                  hintText: "Project Type",
                  label: "Design",
                  controller: projectType,
                  keyboardType: TextInputType.text),
              Row(
                children: [
                  Expanded(
                    child: customTextField(
                        hintText: "Enter value",
                        label: "Value",
                        controller: value,
                        keyboardType: TextInputType.number),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: customTextField(
                        hintText: "2",
                        label: "Invoice No.",
                        controller: invoiceNo,
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
              Text(
                "Invoice -1",
                style: TextStyle(
                    color: kRedColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Row(
                children: [
                  Expanded(
                    child: customTextField(
                        hintText: "Invoice value",
                        label: "Value",
                        controller: invoiceValue,
                        keyboardType: TextInputType.number),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: customTextField(
                        hintText: "Selected date",
                        label: "Expected Date",
                        controller: expectedDate,
                        keyboardType: TextInputType.datetime,
                        suffixFunction: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            expectedDate.text =
                                DateFormat("yyyy-MM-dd").format(value);
                            ;
                          });
                        },
                        suffix: Icons.calendar_today),
                  ),
                ],
              ),
              customTextField(
                  hintText: "Enter start date",
                  label: "Start Date",
                  controller: startDate,
                  keyboardType: TextInputType.datetime,
                  suffixFunction: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                        .then((value) {
                      startDate.text = DateFormat("yyyy-MM-dd").format(value);
                    });
                  },
                  suffix: Icons.calendar_today),
              customTextField(
                  hintText: "Enter End date",
                  label: "End Date",
                  controller: endDate,
                  keyboardType: TextInputType.datetime,
                  suffixFunction: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                        .then((value) {
                      endDate.text = DateFormat("yyyy-MM-dd").format(value);
                    });
                  },
                  suffix: Icons.calendar_today),
              customTextField(
                  hintText: "Enter deadline",
                  label: "deadline",
                  controller: deadline,
                  keyboardType: TextInputType.datetime,
                  suffixFunction: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                        .then((value) {
                      deadline.text = DateFormat("yyyy-MM-dd").format(value);
                    });
                  },
                  suffix: Icons.calendar_today),
              FutureBuilder<AllLocationsModel>(
                  future: appCubit.getLocations(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("pppppppp${snapshot.data.locations}");
                      return customDropdownMenu(
                          onChanged: (value) {
                            setState(() {
                              location = value;
                              print(location);
                            });
                          },
                          itemList: locationsList
                              .map<DropdownMenuItem<Locations>>(
                                  (Locations value2) {
                            return DropdownMenuItem<Locations>(
                              value: value2,
                              child: Container(
                                  width: 90, child: Text(value2.title)),
                            );
                          }).toList(),
                          hintText: "Locations",
                          value: location ?? null,
                          label: "Choose Location(single)");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              FutureBuilder<AllEmployeesModel>(
                  future: appCubit.getEmployees(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("pppppppp${snapshot.data.users}");
                      return customDropdownMenu(
                          onChanged: (value) {
                            setState(() {
                              issuedTo = value;
                              print(employees);
                            });
                          },
                          itemList: employeesList
                              .map<DropdownMenuItem<Users>>((Users value2) {
                            return DropdownMenuItem<Users>(
                              value: value2,
                              child: Container(
                                  width: 90, child: Text(value2.name)),
                            );
                          }).toList(),
                          hintText: "Choose from Employees",
                          value: issuedTo ?? null,
                          label: "Issued To(single)");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              if (AppCubit.get(context).allVehicles != null)
                customDropdownMenu(
                    onChanged: (value) {
                      setState(() {
                        vehicle = value;
                        print(vehicle);
                      });
                    },
                    itemList: AppCubit.get(context)
                        .allVehicles
                        .vehicles
                        .map<DropdownMenuItem<Vehicle>>((Vehicle value2) {
                      return DropdownMenuItem<Vehicle>(
                        value: value2,
                        child: Container(width: 90, child: Text(value2.name)),
                      );
                    }).toList(),
                    hintText: "Choose from Vehicles",
                    value: vehicle ?? null,
                    label: "Choose Vehicles(optional)")
              else
                Center(child: CircularProgressIndicator()),
              customTextField(
                  hintText: "Attach Time Schedule link here",
                  controller: scheduleLink,
                  showLabel: false,
                  suffix: Icons.link),
              customTextField(
                  hintText: "Attach Project Contract link here",
                  showLabel: false,
                  controller: contractLink,
                  suffix: Icons.link),
              customTextField(
                  hintText: "Attach other files",
                  showLabel: false,
                  controller: otherFile,
                  suffix: Icons.link),
              FutureBuilder<AllEmployeesModel>(
                  future: appCubit.getEmployees(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("pppppppp${snapshot.data.users}");
                      return customDropdownMenu(
                          onChanged: (value) {
                            setState(() {
                              taskCreator = value;
                              print(employees);
                            });
                          },
                          itemList: employeesList
                              .map<DropdownMenuItem<Users>>((Users value2) {
                            return DropdownMenuItem<Users>(
                              value: value2,
                              child: Container(
                                  width: 90, child: Text(value2.name)),
                            );
                          }).toList(),
                          hintText: "Choose from Employees",
                          value: taskCreator ?? null,
                          label: "Issued To(single)");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              projectImage == null
                  ? uploadFile("Upload Car Photo", () {
                      showpanel("");
                    })
                  : Image.file(
                      projectImage,
                      height: 80,
                      width: double.infinity,
                    ),
              customTextField(
                hintText: "Notes",
                controller: notes,
                label: "Notes",
              ),
              defaultButton(
                  text: "Save Project",
                  onPressed: () {
                    AppCubit.get(context).addProject(
                      name: projectName.text,
                      type: projectType.text,
                      start_date: startDate.text,
                      end_date: endDate.text,
                      deadline: deadline.text,
                      notes: notes.text,
                      contract_link: contractLink.text,
                      value: value.text,
                      location_id: location,
                      invoices_no: invoiceNo.text,
                      vehicles: vehicle,
                      employees: issuedTo,
                      task_creator: taskCreator,
                      photo: projectImage,
                      schedual_link: scheduleLink.text,
                    );
                  },
                  color: kPrimaryColor),
              SizedBox(
                height: 4.h,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 90),
                child: Text(
                  "Return To All Projects",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kRedColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showpanel(type) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (context) {
          var size = MediaQuery.of(context).size;
          var sHeight = MediaQuery.of(context).size.height;
          var sWidth = MediaQuery.of(context).size.width;
          return Container(
            height: size.height * .16,
            width: size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                  top: size.height * .0008,
                  left: size.width * .38,
                  child: Text(
                    "upload image",
                    style: (TextStyle(color: Colors.blue, fontSize: 20)),
                  ),
                ),
                Positioned(
                  top: size.height * .04,
                  right: size.width * .03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              openGallary();
                            },
                            child: Container(
                              height: sHeight * .07,
                              width: sWidth * .15,
                              child: Image.asset(
                                'assets/images/gallery.png',
                                width: sWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("الصور",
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: sWidth * .2,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              openCamera();
                            },
                            child: Container(
                              height: sHeight * .07,
                              width: sWidth * .15,
                              child: Image.asset(
                                'assets/images/camera.png',
                                width: sWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("الكاميرا",
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> openGallary() async {
    PickedFile picture =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      projectImage = File(picture.path);
      print(projectImage.path);
      Navigator.of(context).pop();
    });
  }

  Future<void> openCamera() async {
    PickedFile picture =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      projectImage = File(picture.path);

      Navigator.of(context).pop();
    });
  }

  Widget uploadFile(String title, Function onPress) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        height: 100,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title),
              SizedBox(
                width: 4,
              ),
              Image.asset(
                "assets/images/upload.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
