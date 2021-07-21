import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class CreateNewVehicles extends StatelessWidget {
  const CreateNewVehicles({Key key}) : super(key: key);

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
                height: 3.h,
              ),
              customTextField(
                hintText: "Vehicle Number",
                label: "Vehicle Number",
              ),
              customTextField(hintText: "Vehicle Name", label: "Vehicle Name"),
              customTextField(
                  hintText: "Vehicle Model", label: "Vehicle Model"),
              customTextField(hintText: "Maintenance", label: "Vehicle Status"),
              customTextField(hintText: "Kilometers", label: "Kilometers"),
              customTextField(
                  label: "Insurance Date Start",
                  hintText: "Enter Start date",
                  suffix: Icons.calendar_today),
              customTextField(
                  hintText: "Enter Deadline date",
                  label: "Insurance Date End",
                  suffix: Icons.calendar_today),
              Container(
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child:
                      Text("Add Photo", style: TextStyle(color: Colors.grey)),
                ),
              ),
              customTextField(
                  hintText: "License Number", label: "License Number"),
              customTextField(
                  hintText: "License Date End",
                  label: "License Date End",
                  suffix: Icons.calendar_today),
              Container(
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text("Upload Insurance Photo",
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
              customTextField(
                  hintText: "Examination Date",
                  label: "Examination Date",
                  suffix: Icons.calendar_today),
              customDropdownMenu(
                  onChanged: (value) {},
                  itemList: [],
                  hintText: "Choose from Employees",
                  label: "Issued To(single)"),
              Container(
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text("Upload Driver License",
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
              customDropdownMenu(
                  onChanged: (value) {},
                  itemList: [],
                  hintText: "Choose from Locations",
                  label: "Assigned Location(Multiple)"),
              Container(
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text("Upload Car Photo",
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
              customTextField(
                hintText: "Notes",
                label: "Notes",
              ),
              defaultButton(
                  text: "Save Vehicle", onPressed: () {}, color: kPrimaryColor),
              Padding(
                padding: EdgeInsets.only(left: 90),
                child: TextButton(
                  onPressed: () {},
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
