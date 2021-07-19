import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => buildVehiclesCard(),
        separatorBuilder: (context, index) => SizedBox(
              height: 2.h,
            ),
        itemCount: 1);
  }
}

Widget buildVehiclesCard() => Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/Mask Group 2.png",
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
                      width: 1.w,
                    ),
                    const Text(
                      "Toyota 2015",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: const [
                    Text(
                      "Issued to :   ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text("mohammed ahmed",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: const [
                    Text(
                      "Assigned Location :   ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text("Location-1",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: const [
                    Text(
                      "Insurance date end :   ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text("2-6-2021",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "More details",
                  style: TextStyle(color: Color(0xff0D204C)),
                )
              ],
            ),
          )
        ],
      ),
    );
