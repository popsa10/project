import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/notifications/send_notification_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class AllNotificationScreen extends StatelessWidget {
  const AllNotificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Notification",
          search: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: defaultButton(
                  text: "Send Notification",
                  onPressed: () {
                    navigateTo(context, SendNotificationScreen());
                  },
                  color: kPrimaryColor),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      buildNotificationCard(context),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2.h,
                      ),
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildNotificationCard(context) => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "6 june 2021",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Mohamed Ahmed add report",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
