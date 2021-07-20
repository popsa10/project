import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:project/constants.dart';
import 'package:sizer/sizer.dart';

Widget defaultButton(
        {required String text,
        Color color = kDefaultButtonColor,
        required Function onPressed,
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
        {required TextEditingController controller,
        bool isPassword = false,
        required String hintText,
        required Widget suffix,
        Function? onSubmit,
        Function? suffixFunction,
        required Function validate,
        required TextInputType type}) =>
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
          onTap: () {
            suffixFunction!();
          },
          child: suffix,
        ),
        fillColor: kTextFormFieldColor,
        filled: true,
      ),
    );

Widget defaultText(
        {required String text,
        double fontSize = 20,
        FontWeight fontWeight = FontWeight.normal,
        Color color = Colors.white}) =>
    Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );

PreferredSizeWidget customAppbar({
  bool search = false,
  TextEditingController? controller,
  required String title,
  required BuildContext context,
}) =>
    AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: search == true ? 16.h : 9.5.h,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(15),
                bottomEnd: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/Group 1558.png")),
                  const Spacer(),
                  defaultText(
                      text: title, fontSize: 16, fontWeight: FontWeight.normal),
                  const Spacer(),
                  Image.asset(
                    "assets/images/Icon.png",
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 0.5.w,
                  ),
                  Image.asset(
                    "assets/images/Mask Group 31.png",
                    height: 9.w,
                  )
                ],
              ),
              SizedBox(
                height: 0.85.h,
              ),
              if (search == true)
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 6.5.h,
                        child: defaultFormField(
                            controller: controller ?? TextEditingController(),
                            hintText: "Search",
                            suffix: Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Container(
                                height: 2.h,
                                width: 2.w,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validate: () {},
                            type: TextInputType.text),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Container(
                        height: 6.5.h,
                        width: 13.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Group 1890.png")))),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
PreferredSizeWidget mycustomAppbar({bool canpop=false,required BuildContext context,  bool havebell=true,  bool haveNotf=false,required String titel}){
  return AppBar(
    elevation: 0,toolbarHeight: 75,    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(15),
              bottomEnd: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8,top: 8),
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               canpop?   GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/images/Group 1558.png" )):SizedBox(),
                Text(
                  titel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
             if(havebell)       Container(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: Stack(
                          children: [
                            Icon(
                              Elusive.bell,
                              size: 30,
                              color: Colors.white,
                            ),
                            if(haveNotf)     Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: new BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      //color: Colors.indigo,
                    ),
                    Image.asset(
                      "assets/images/Mask Group 31.png",
                      height: 50,
                      width: 50,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}