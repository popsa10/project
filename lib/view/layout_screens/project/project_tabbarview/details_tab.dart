import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 20),
        child: Container(
          decoration: const BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(15), topEnd: Radius.circular(15))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    defaultContainer(const Color(0xffF1FBF5),
                        const Color(0xff039712), "Tasks", 50),
                    defaultContainer(const Color(0xffFCECE4),
                        const Color(0xffCE3827), "Employees", 22),
                    defaultContainer(const Color(0xffFBE9CC),
                        const Color(0xffFCC163), "Vehicles", 44),
                  ],
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    height: 25.h,
                    width: double.infinity,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 25.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: kRedColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: defaultText(text: "Design", fontSize: 15)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRowForDetails("Project Name", "New building Project"),
                    buildRowForDetails("Project Value", "25000 SAR"),
                    buildRowForDetails("Invoice Number", "3"),
                    buildRowForDetails("Project Type", "Design"),
                    buildRowForDetails("Start Date", "2-2-2021"),
                    buildRowForDetails("End Date", "2-6-2021"),
                    buildRowForDetails("Location", "Location-1"),
                    buildRowForDetails("Task Creator", "Khaled Ali"),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    const Text(
                      "Notes",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: kTitleColor),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20, bottom: 10),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, color: kGreyColor),
                      ),
                    ),
                    const Text(
                      "view On Map",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kRedColor),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/map.png",
                    width: double.infinity,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 50,
                    child: Image.asset(
                      "assets/images/ic_current.png",
                      width: 30.w,
                      height: 10.h,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Project Schedule",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: kTitleColor),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/Icon feather-eye.png",
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            const Text(
                              "view",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: kRedColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Project Contract",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: kTitleColor),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/Icon feather-eye.png",
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            const Text(
                              "view",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: kRedColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Other Files",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: kTitleColor),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/Icon feather-eye.png",
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            const Text(
                              "view",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: kRedColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                        height: 8.2.h,
                        width: 17.w,
                        decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Image.asset(
                          "assets/images/Icon feather-printer.png",
                          fit: BoxFit.cover,
                          width: 10.w,
                        ))),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: defaultButton(
                          text: "Export",
                          onPressed: () {},
                          color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRowForDetails(String title, String text) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: kTitleColor),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style:
                const TextStyle(color: kGreyColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
