import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import 'new_task_screen.dart';

class ProjectDetails extends StatelessWidget {
  ProjectDetails({Key key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Workflow",
          search: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultText(
                    text: "New building project",
                    color: kTitleColor,
                    fontWeight: FontWeight.normal),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            minRadius: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 3.w,
                                    height: 3.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kGreenColor),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  defaultText(
                                      text: "Completed",
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  defaultText(
                                      text: "3",
                                      color: Colors.grey,
                                      fontSize: 16)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 3.w,
                                    height: 3.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  defaultText(
                                      text: "In Progress",
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  defaultText(
                                      text: "12",
                                      color: Colors.grey,
                                      fontSize: 16)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 3.w,
                                    height: 3.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kRedColor),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  defaultText(
                                      text: "Delayed",
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  SizedBox(
                                    width: 10.5.w,
                                  ),
                                  defaultText(
                                      text: "5",
                                      color: Colors.grey,
                                      fontSize: 16)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultButton(
                              text: "Create New Task",
                              onPressed: () {
                                navigateTo(context, NewTaskScreen());
                              },
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          defaultButton(
                            text: "Add Note",
                            width: 30.w,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    defaultText(
                        text: "Project tasks",
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    defaultText(
                        text: "7 quantity",
                        color: kGreyColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildProjectTasksCard(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2.h,
                      ),
                  itemCount: 4),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildProjectTasksCard() => Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(15), topEnd: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 1.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultText(
                            text: "6 june 2021 - - - - - 16 june 2021",
                            color: kTitleColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.h,
                        ),
                        defaultText(
                            text: "Task :  NewTask -1",
                            color: kGreyColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.h,
                        ),
                        defaultText(
                            text: "Task Admin :   Khaled Ali",
                            color: kGreyColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.h,
                        ),
                        defaultText(
                            text: "Assigned To",
                            color: kGreyColor,
                            fontSize: 12),
                        SizedBox(
                          height: 1.h,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[300],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 9.w,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          defaultText(
                              text: "Completed",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: kGreenColor)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [],
                      color: Colors.grey[100],
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 1,
                  color: kGreyColor,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defaultText(
                          text: "More detailed",
                          color: kTitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      const Text(
                        "Add Note",
                        style: TextStyle(
                            color: kGreenColor,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 3.w,
          height: 9.h,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20))),
        ),
      ],
    );
