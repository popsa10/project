import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              defaultText(
                text: "Employees List (4)",
                color: Colors.black,
              ),
              Image.asset(
                "assets/images/Icon metro-sort-desc.png",
                width: 6.w,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => employeeCard(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 2.h,
                  ),
              itemCount: 4),
        )
      ],
    );
  }
}

Widget employeeCard() => Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8.w,
            height: 4.h,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                "32",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Image.asset(
            "assets/images/Rectangle 616.png",
            width: 20.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Mohamed Ahmed",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: kRedColor),
              ),
              Text(
                "Tichnican",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: kGreyColor),
              ),
              Text(
                "Regular",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: kTitleColor),
              ),
            ],
          ),
          Spacer(),
          PopupMenuButton(
            itemBuilder: (context) => [],
          )
        ],
      ),
    );
