import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:project/constants.dart';
import 'package:project/view/notifications_screen/all_notification_screen.dart';
import 'package:sizer/sizer.dart';

Widget defaultButton(
        {@required String text,
        Color color = kDefaultButtonColor,
        @required Function onPressed,
        double width = double.infinity,
        double height = 63,
        Color textColor = Colors.white}) =>
    GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

Future<dynamic> navigateTo(BuildContext context, Widget page) =>
    Navigator.of(context).push(MaterialPageRoute(
        builder: (
      context,
    ) =>
            page));

Future<dynamic> navigateToAndFinish(BuildContext context, Widget page) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
        (route) => false);

Widget defaultFormField(
        {@required TextEditingController controller,
        bool isPassword = false,
        @required String hintText,
        @required Widget suffix,
        Function onSubmit,
        Function suffixFunction,
        @required Function validate,
        @required TextInputType type}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffC8C8C8), fontSize: 11),
        suffixIcon: InkWell(
          onTap: suffixFunction,
          child: suffix,
        ),
        fillColor: kTextFormFieldColor,
        filled: true,
      ),
    );

Widget newTaskField(
        {@required TextEditingController controller,
        @required TextInputType keyboardType,
        @required String label,
        @required String hintText,
        int maxLines = 1}) =>
    TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: kGreyColor, fontWeight: FontWeight.bold),
          labelText: label,
          labelStyle: const TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

Widget defaultText(
        {@required String text,
        double fontSize = 20,
        FontWeight fontWeight = FontWeight.normal,
        Color color = Colors.white}) =>
    Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool search;
  const CustomAppBar({
    @required this.title,
    this.search = false,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Column(
        children: [
          AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/Group 1558.png")),
            title: Text(
              title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            actions: [
              IconButton(
                icon: Image.asset(
                  "assets/images/Icon.png",
                  height: 30,
                ),
                onPressed: () {
                  navigateTo(context, const AllNotificationScreen());
                },
              ),
              IconButton(
                icon: Image.asset(
                  "assets/images/Mask Group 31.png",
                ),
                onPressed: () {},
              ),
            ],
          ),
          if (search == true)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(
                          color: Color(0xffC8C8C8), fontSize: 11),
                    ),
                    toolbarOptions: ToolbarOptions(),
                  )),
                  SizedBox(
                    width: 1.w,
                  ),
                  Container(
                      height: 6.5.h,
                      width: 13.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/Group 1890.png")))),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(search == true ? 120 : 60);
}

Widget buildProjectCard(context, Widget page) => InkWell(
      onTap: () {
        navigateTo(context, page);
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

Widget defaultContainer(
        Color color, Color borderColor, String text, int number) =>
    Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          defaultText(
              text: "$number",
              color: Color(0xff707070),
              fontWeight: FontWeight.bold),
          defaultText(
            text: text,
            color: Color(0xff707070),
          )
        ],
      ),
    );

Widget buildRowForChart(String text, Color color, int number) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 3.w,
          height: 3.h,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(
          width: 2.w,
        ),
        defaultText(
            text: text,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16),
        SizedBox(
          width: 2.w,
        ),
        defaultText(text: "$number", color: Colors.grey, fontSize: 16)
      ],
    );

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
                    Column(
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
                    SizedBox(
                      width: 1.w,
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: kGreyColor,
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
