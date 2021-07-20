import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'create_record.dart';

class MaintainanceScreen extends StatelessWidget {
  const MaintainanceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: defaultButton(
              text: "Add New Record",
              onPressed: () {
                navigateTo(context, CreateRecord());
              },
              color: kPrimaryColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This Car Has 3 Maintenance Records",
                style: TextStyle(color: kPrimaryColor),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Select Date Range",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.red),
                  )),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => buildMaintainanceRecord(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
              itemCount: 3),
        )
      ],
    );
  }
}

Widget buildMaintainanceRecord() => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "12-8-2020",
              style: TextStyle(color: kGreyColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "mohamed ahmed",
              style: TextStyle(color: kPrimaryColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "car changed oil and batter",
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
