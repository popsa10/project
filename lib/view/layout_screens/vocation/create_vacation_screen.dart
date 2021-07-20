import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';

class CreateVacationScreen extends StatelessWidget {
  const CreateVacationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Vocations",
        search: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Vacation Request",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            customDropdownMenu(
                itemList: [],
                onChanged: (value) {},
                hintText: "Paid",
                label: "Vacation Type"),
            customTextField(
                //controller: controller,
                label: "Vacation Name",
                hintText: "Ex: National Days"),
            customTextField(
                //controller: controller,
                label: "Start Date",
                hintText: "Select Date",
                suffix: Icons.calendar_today),
            customTextField(
                //controller: controller,
                label: "End Date",
                hintText: "Select Date",
                suffix: Icons.calendar_today),
            customDropdownMenu(
                itemList: [],
                onChanged: (value) {},
                hintText: "Select Employees",
                label: "Assigned To(Multiple)"),
            customTextField(
                //controller: controller,
                label: "Reason",
                hintText: "Reason"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: defaultButton(
                  text: "Submit Request",
                  onPressed: () {},
                  color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
