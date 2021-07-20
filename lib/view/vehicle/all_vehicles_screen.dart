import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/vehicle/vehicle_details.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'add_new_vehicle.dart';

class AllVehicles extends StatelessWidget {
  const AllVehicles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Vehicles",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: defaultButton(
                text: "Add New Vehicle",
                onPressed: () {
                  navigateTo(context, CreateNewVehicles());
                },
                color: kPrimaryColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              defaultContainer(
                  Color(0xffF1FBF5), Color(0xff039712), "Working", 10),
              defaultContainer(
                  Color(0xffFBE9CC), Color(0xffFCC163), "Maintainance", 20),
              defaultContainer(
                  Color(0xffFCECE4), Color(0xffCE3827), "Accident", 30),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultText(
                    text: "Vehiicle List (14)",
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                Image.asset(
                  "assets/images/Icon metro-sort-desc.png",
                  width: 5.w,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => vehicleDetails(context),
                separatorBuilder: (context, index) => SizedBox(
                      height: 2.h,
                    ),
                itemCount: 3),
          ),
        ],
      ),
    );
  }
}

Widget vehicleDetails(
  context,
) =>
    Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                "assets/images/Mask Group 2.png",
              ),
              Container(
                margin: const EdgeInsets.all(15),
                width: 28.w,
                height: 5.h,
                decoration: BoxDecoration(
                    color: kRedColor, borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: defaultText(text: "Maintainance", fontSize: 15)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Toyota 15",
                      style: TextStyle(
                          color: kRedColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Issued To :",
                        style: TextStyle(
                            color: kTitleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        "mohamed ahmed",
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
                      "Assigned Location :",
                      style: TextStyle(
                          color: kTitleColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Text(
                      "Location 1",
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
                        "Insurance date end :",
                        style: TextStyle(
                            color: kTitleColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "2-6-2021",
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                TextButton(
                    onPressed: () {
                      navigateTo(context, VehicleDetails());
                    },
                    child: Text(
                      "More details",
                      style: TextStyle(color: kGreyColor, fontSize: 17),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
