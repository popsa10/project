import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';
import '../../../constants.dart';

class PaidVocationScreen extends StatelessWidget {
  const PaidVocationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: defaultButton(
              text: "Create Vacation", onPressed: () {}, color: kPrimaryColor),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => buildVacationCard(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
              itemCount: 1),
        )
      ],
    );
  }
}

Widget buildVacationCard() => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10),
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
                Spacer(),
                Container(
                  width: 20.w,
                  color: kGreenColor,
                  child: Center(
                    child: Text(
                      "Paid",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
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
                    width: 16.w,
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
                  width: 18.w,
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Assigned To",
                    style: TextStyle(
                        color: kTitleColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Ali",
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
                  "Submitted By",
                  style: TextStyle(
                      color: kTitleColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Khaled ali",
                  style: TextStyle(
                      color: kGreyColor,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
