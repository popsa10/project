import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

import 'create_vacation_screen.dart';

class VocationRequestScreen extends StatelessWidget {
  const VocationRequestScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: defaultButton(
              text: "Create Vacation",
              onPressed: () {
                navigateTo(context, CreateVacationScreen());
              },
              color: kPrimaryColor),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => buildVacationRequestCard(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
              itemCount: 2),
        )
      ],
    );
  }
}

Widget buildVacationRequestCard() => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 8.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "32",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Eid Al Adha",
                  style: TextStyle(
                      color: kRedColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Start Date",
                    style: TextStyle(
                        color: kTitleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "20-7-2021",
                    style: TextStyle(
                        color: kGreyColor,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "End Date",
                  style: TextStyle(
                      color: kTitleColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "20-7-2021",
                  style: TextStyle(
                      color: kGreyColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    "Reason",
                    style: TextStyle(
                        color: kTitleColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "doctor visit",
                    style: TextStyle(
                        color: kGreyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Status",
                  style: TextStyle(
                      color: kTitleColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "Approved",
                  style: TextStyle(
                      color: kGreyColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Accept",
                    style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        color: kGreenColor),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Reject",
                    style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        color: kRedColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
