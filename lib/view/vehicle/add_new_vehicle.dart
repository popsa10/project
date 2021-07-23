import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/vehicle/all_vehicles_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class CreateNewVehicles extends StatelessWidget {
  CreateNewVehicles({Key key}) : super(key: key);
  final vehicleNumber = TextEditingController();
  final vehicleName = TextEditingController();
  final vehicleModel = TextEditingController();
  final vehicleStatus = TextEditingController();
  final kilometers = TextEditingController();
  final insuranceDateStart = TextEditingController();
  final insuranceDateEnd = TextEditingController();
  final licenseNumber = TextEditingController();
  final licenseDateEnd = TextEditingController();
  final examinationDate = TextEditingController();
  final notes = TextEditingController();
  String IssuedTo;
  List<String> Locations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Create New Vehicle",
        search: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create New Vehicle",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              SizedBox(
                height: 2.h,
              ),
              customTextField(
                hintText: "Vehicle Number",
                label: "Vehicle Number",
                keyboardType: TextInputType.number,
                controller: vehicleNumber,
              ),
              customTextField(
                  hintText: "Vehicle Name",
                  label: "Vehicle Name",
                  keyboardType: TextInputType.name,
                  controller: vehicleName),
              customTextField(
                  hintText: "Vehicle Model",
                  label: "Vehicle Model",
                  keyboardType: TextInputType.name,
                  controller: vehicleModel),
              customTextField(
                  hintText: "Maintenance",
                  label: "Vehicle Status",
                  keyboardType: TextInputType.text,
                  controller: vehicleStatus),
              customTextField(
                  hintText: "Kilometers",
                  label: "Kilometers",
                  keyboardType: TextInputType.number,
                  controller: kilometers),
              customTextField(
                  label: "Insurance Date Start",
                  hintText: "Enter Start date",
                  controller: insuranceDateStart,
                  suffix: Icons.calendar_today,
                  suffixFunction: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                        .then((value) {
                      insuranceDateStart.text = value.toString();
                    });
                  },
                  keyboardType: TextInputType.datetime),
              customTextField(
                hintText: "Enter Deadline date",
                label: "Insurance Date End",
                controller: insuranceDateEnd,
                keyboardType: TextInputType.datetime,
                suffix: Icons.calendar_today,
                suffixFunction: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050))
                      .then((value) {
                    insuranceDateEnd.text = value.toString();
                  });
                },
              ),
              uploadFile("Add Photo", () {}),
              customTextField(
                  hintText: "License Number",
                  label: "License Number",
                  keyboardType: TextInputType.number,
                  controller: licenseNumber),
              customTextField(
                hintText: "License Date End",
                label: "License Date End",
                keyboardType: TextInputType.datetime,
                controller: licenseDateEnd,
                suffix: Icons.calendar_today,
                suffixFunction: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050))
                      .then((value) {
                    licenseDateEnd.text = value.toString();
                  });
                },
              ),
              uploadFile("Upload File", () {}),
              customTextField(
                hintText: "Examination Date",
                label: "Examination Date",
                controller: examinationDate,
                keyboardType: TextInputType.datetime,
                suffix: Icons.calendar_today,
                suffixFunction: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050))
                      .then((value) {
                    examinationDate.text = value.toString();
                  });
                },
              ),
              customDropdownMenu(
                  onChanged: (value) {},
                  itemList: [],
                  hintText: "Choose from Employees",
                  value: IssuedTo,
                  label: "Issued To(single)"),
              uploadFile("Upload Driver License", () {}),
              customDropdownMenu(
                  onChanged: (value) {},
                  itemList: [],
                  hintText: "Choose from Locations",
                  value: Locations,
                  label: "Assigned Location(Multiple)"),
              uploadFile("Upload Car Photo", () {}),
              customTextField(
                hintText: "Notes",
                label: "Notes",
                controller: notes,
                keyboardType: TextInputType.text,
              ),
              defaultButton(
                  text: "Save Vehicle", onPressed: () {}, color: kPrimaryColor),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    navigateToAndFinish(context, AllVehicles());
                  },
                  child: Text(
                    "Return To All vehicle",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: kRedColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
