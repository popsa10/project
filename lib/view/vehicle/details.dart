import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/details_tab.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'add_new_vehicle.dart';

class Details extends StatelessWidget {
  const Details({Key key}) : super(key: key);

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
              Container(
                height: 25.h,
                width: double.infinity,
                color: Colors.yellow,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRowForDetails("Vehicle Number", "32"),
                    buildRowForDetails("Vehicle Name", "Toyota corolla"),
                    buildRowForDetails("Vehicle Model", "Toyota"),
                    buildRowForDetails("Vehicle Status", "Working"),
                    buildRowForDetails("Kilometers", "150"),
                    buildRowForDetails("Insurance Date Start", "2-6-2021"),
                    buildRowForDetails("Lisence Number", "123456"),
                    buildRowForDetails("License Date End", "2-6-2021"),
                    buildRowForDetails("Examination Date", "2-6-2021"),
                    buildRowForDetails("Issued To", "Mohamed ahmed"),
                    buildRowForDetails("Assigned Location", "Location 1"),
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
                      "Documentation",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kRedColor),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Insurance Photo",
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
                          "Licence Photo",
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
                          "Upload Driver License",
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
                      height: 4.h,
                    ),
                    Row(
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
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
