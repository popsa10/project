import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/workflow/workflow_projectdetails_screen.dart';
import 'package:sizer/sizer.dart';

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                  child: defaultText(
                    text: "projects List (3)",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.zero,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildProjectCard(context, ProjectDetails()),
                separatorBuilder: (context, index) => SizedBox(
                      height: 2,
                    ),
                itemCount: 3),
          ),
        ],
      ),
    );
  }
}
