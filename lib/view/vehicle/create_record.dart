import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

class CreateRecord extends StatelessWidget {
  const CreateRecord({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Maintenance",
        search: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Maintenance Record",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            customTextField(
                //controller: controller,
                label: "Date",
                suffix: Icons.calendar_today,
                hintText: "Select Date"),
            customTextField(
                //controller: controller,
                label: "Description",
                hintText: "Add Description"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: defaultButton(
                  text: "Save Record", onPressed: () {}, color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
