import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/workflow/workflow_projectdetails_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../constants.dart';

class WorkflowScreen extends StatelessWidget {
  WorkflowScreen({Key key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Workflow",
        search: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: defaultText(
                      text: "projects List (3)",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.zero,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildProjectCard(context),
                separatorBuilder: (context, index) => SizedBox(
                      height: 2,
                    ),
                itemCount: 3),
          ],
        ),
      ),
    );
  }
}

Widget buildProjectCard(context) => InkWell(
      onTap: () {
        navigateTo(context, ProjectDetails());
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                bottomStart: Radius.circular(10))),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  height: 22.h,
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
                  child:
                      Center(child: defaultText(text: "Design", fontSize: 15)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                          text: "New building project",
                          color: kRedColor,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          defaultText(
                              text: "start Date :  ",
                              color: kTitleColor,
                              fontSize: 13),
                          defaultText(
                              text: "2-2-2021", color: kGreyColor, fontSize: 13)
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          defaultText(
                              text: "Deadline :    ",
                              color: kTitleColor,
                              fontSize: 13),
                          defaultText(
                              text: "2-2-2021", color: kGreyColor, fontSize: 13)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10.w,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
