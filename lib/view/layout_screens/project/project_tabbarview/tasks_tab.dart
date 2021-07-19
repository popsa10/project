import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/workflow/new_task_screen.dart';
import 'package:project/view/layout_screens/workflow/workflow_projectdetails_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                          buildRowForChart("Completed", kGreenColor, 3),
                          buildRowForChart("In Progress", Colors.yellow, 12),
                          buildRowForChart("delayed", kRedColor, 5),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      defaultButton(
                          text: "Create New Task",
                          onPressed: () {
                            navigateTo(context, NewTaskScreen());
                          },
                          color: kPrimaryColor,
                          width: 56.w),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: defaultButton(
                          text: "Add Note",
                          onPressed: () {},
                        ),
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
    );
  }
}
