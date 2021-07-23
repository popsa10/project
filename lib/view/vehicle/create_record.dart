import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

class CreateRecord extends StatelessWidget {
  CreateRecord({Key key}) : super(key: key);

  final date = TextEditingController();
  final description = TextEditingController();

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
                controller: date,
                label: "Date",
                suffix: Icons.calendar_today,
                keyboardType: TextInputType.datetime,
                suffixFunction: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050))
                      .then((value) {
                    date.text = value.toString();
                  });
                },
                hintText: "Select Date"),
            customTextField(
                controller: description,
                label: "Description",
                keyboardType: TextInputType.text,
                hintText: "Add Description"),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: defaultButton(
                  text: "Save Record", onPressed: () {}, color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
