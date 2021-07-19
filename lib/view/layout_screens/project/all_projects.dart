import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:sizer/sizer.dart';

import 'create_project_screen.dart';
import 'project_details.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Projects",
        search: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: defaultButton(
                text: "Add New Project",
                onPressed: () {
                  navigateTo(context, CreateProjectScreen());
                },
                color: kPrimaryColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              defaultContainer(
                  Color(0xffFBE9CC), Color(0xffFCC163), "Ongoing", 10),
              defaultContainer(
                  Color(0xffF1FBF5), Color(0xff039712), "Completed", 20),
              defaultContainer(
                  Color(0xffFCECE4), Color(0xffCE3827), "Canceled", 30),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultText(
                    text: "Projects List",
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
                itemBuilder: (context, index) =>
                    buildProjectCard(context, ProjectDetails()),
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
