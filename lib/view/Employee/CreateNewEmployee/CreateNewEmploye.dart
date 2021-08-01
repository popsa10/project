import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shared/ComponentButton.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';

import '../addEmployee.dart';

class CreateNewEmlpoye extends StatefulWidget {
  @override
  _CreateNewEmlpoyeState createState() => _CreateNewEmlpoyeState();
}

class _CreateNewEmlpoyeState extends State<CreateNewEmlpoye> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController postionController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController joiningController = TextEditingController();
  TextEditingController contractController = TextEditingController();
  TextEditingController insuranceStartController = TextEditingController();
  TextEditingController insuranceEndController = TextEditingController();
  TextEditingController attachmentController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController workingStartController = TextEditingController();
  TextEditingController workingEndController = TextEditingController();
  TextEditingController workingDayController = TextEditingController();
  TextEditingController accountinationController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController detuctionController = TextEditingController();
  TextEditingController vactionController = TextEditingController();
  TextEditingController overtimeController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  int group1Value;
  String partTime = "partTime";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => {
          if (state is AppScuessADDEmployeeStates) print(state.toString()),
          // showToast(
          //     text: states.shopLoginModel.message,
          //     states: ToastStates.Sucess),
        },
        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ////  addd photo and Circle Button  //// /
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          height: 120,
                          child: DottedBorder(
                            color: Colors.grey,
                            strokeWidth: 2,
                            borderType: BorderType.Rect,
                            dashPattern: [6, 6],
                            //dash patterns, 10 is dash width, 6 is space width
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  AppCubit.get(context).getProfileImage();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFCFCF2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Add Photo"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image(
                                      image: AssetImage(
                                        "assets/images/Icon feather-upload-cloud.png",
                                      ),
                                      fit: BoxFit.fill,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        //////// Circle  Radio
                        SizedBox(
                          width: 20,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Employee Type",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //////// radio 1
                            Container(
                              height: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 1,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.red),
                                    groupValue: group1Value,
                                    onChanged: (value) {
                                      setState(() {
                                        group1Value = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    partTime,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            //////// radio 2
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.red),
                                  groupValue: group1Value,
                                  onChanged: (value) {
                                    setState(() {
                                      group1Value = value;
                                    });
                                  },
                                ),
                                Text(
                                  "FreeLancer",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //////////// radio 3
                            Container(
                              height: 25,
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.red),
                                    focusColor: Colors.red,
                                    value: 3,
                                    groupValue: group1Value,
                                    onChanged: (value) {
                                      setState(() {
                                        group1Value = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Regulary",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 10),
                    child: newTaskField(
                      controller: usernameController,
                      label: "User Name",
                      hintText: "User Name",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: passwordController,
                      label: "Password",
                      hintText: "Password",
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: emailController,
                      label: "Email",
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: postionController,
                      label: "Postion",
                      hintText: "Postion",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: contactController,
                      label: "Contact Details",
                      hintText: "Contact Details",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: idController,
                      label: "Iqama or ID",
                      hintText: "Iqama or ID",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: dateController,
                      label: "End Date",
                      hintText: "End Date",
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        AppCubit.get(context).getiqamaphotoImage();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 120,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.Rect,
                        dashPattern: [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCFCF2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Iqama Image",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage(
                                  "assets/images/Icon feather-upload-cloud.png",
                                ),
                                fit: BoxFit.fill,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: joiningController,
                      label: "Joining Date",
                      hintText: "Joining Date",
                      keyboardType: TextInputType.datetime,
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: contractController,
                      label: "Contract End",
                      hintText: "Contract End",
                      keyboardType: TextInputType.datetime,
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: insuranceStartController,
                      label: "Insurance Date Start",
                      hintText: "Insurance Date Start",
                      keyboardType: TextInputType.datetime,
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: insuranceEndController,
                      label: "Insurance Date End",
                      hintText: "Insurance Date End",
                      keyboardType: TextInputType.datetime,
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        AppCubit.get(context).getinsurancephotoImage();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 80,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.Rect,
                        dashPattern: [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCFCF2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Insuarance Photo",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage(
                                  "assets/images/Icon feather-upload-cloud.png",
                                ),
                                fit: BoxFit.fill,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: attachmentController,
                      label: "",
                      hintText: "attatchment link",
                      keyboardType: TextInputType.text,
                      icon: Icon(
                        Icons.attachment,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  ////////////// upload File /////////////
                  InkWell(
                    onTap: () {
                      setState(() {
                        AppCubit.get(context).uploadFile();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 80,
                      child: DottedBorder(
                        color: Colors.grey,
                        strokeWidth: 2,
                        borderType: BorderType.Rect,
                        dashPattern: [6, 6],
                        //dash patterns, 10 is dash width, 6 is space width
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFCFCF2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Other Files",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage(
                                  "assets/images/Icon feather-upload-cloud.png",
                                ),
                                fit: BoxFit.fill,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                      controller: salaryController,
                      label: "Basic Salary",
                      hintText: "Basic Salary",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  ///////////////////////

                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                            controller: workingStartController,
                            label: "Working Start time",
                            hintText: "Start time",
                            keyboardType: TextInputType.number,
                            icon: Icon(Icons.timeline)),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                            controller: workingEndController,
                            label: "Working End time",
                            hintText: "End time",
                            keyboardType: TextInputType.number,
                            icon: Icon(Icons.timeline)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                        controller: workingDayController,
                        label: "Working Days (Multiple) ",
                        hintText: "Select Day",
                        keyboardType: TextInputType.text,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: Colors.grey[300],
                        )),
                  ),
                  /////////////////////////////////////////

                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: accountinationController,
                          label: "Accountion",
                          hintText: "accountion",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: transportationController,
                          label: "Transportion",
                          hintText: "transportion",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

////////////////////////
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: phoneController,
                          label: "Phone",
                          hintText: "Phone",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        child: newTaskField(
                          controller: otherController,
                          label: "Other",
                          hintText: "Other",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  ///////////////////////

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        //////////////    With OVer Time  //////////////
                        SizedBox(
                          width: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "With over Time",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                        controller: subController,
                        label: "Sub Employeee ",
                        hintText: "Choose From Employee",
                        keyboardType: TextInputType.text,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: Colors.grey[300],
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                        controller: detuctionController,
                        label: "Detuction/Bounce",
                        hintText: "Choose From Employee",
                        keyboardType: TextInputType.text,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: Colors.grey[300],
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                        controller: vactionController,
                        label: "Vaction Approval",
                        hintText: "Choose From Employee",
                        keyboardType: TextInputType.text,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: Colors.grey[300],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                        controller: overtimeController,
                        label: "OverTime Approval",
                        hintText: "Choose From Employee",
                        keyboardType: TextInputType.text,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: Colors.grey[300],
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: newTaskField(
                        controller: repeatController,
                        label: "Report Approval",
                        hintText: "Choose From Employee",
                        keyboardType: TextInputType.text,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: Colors.grey[300],
                        )),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: defaultButtonnew(
                          text: "Save Empolyee",
                          onPressed: () async {
                            // AppCubit.get(context).addNewEmployee(
                            //   name: usernameController.text,
                            //   photo: AppCubit.get(context).photoimage.path,
                            //   iqamaphoto: AppCubit.get(context).iqamaphoto.path,
                            //   passportphoto:
                            //       AppCubit.get(context).passportphoto.path,
                            //   insurancephoto:
                            //       AppCubit.get(context).insurancephoto.path,
                            //   contractfile:
                            //       AppCubit.get(context).fileupload.path,
                            //   others: otherController.text,
                            //   email: emailController.text,
                            //   password: passwordController.text,
                            //   phone: phoneController.text,
                            //   salary: salaryController.text,
                            //   workdayes: workingDayController.text,
                            //   workstart: workingStartController.text,
                            //   workend: workingEndController.text,
                            //   iqamaenddate: idController.text,
                            //   passportenddate: dateController.text,
                            //   joiningdate: joiningController.text,
                            //   contractdate: contractController.text,
                            //   insuranceenddate: insuranceEndController.text,
                            //   insurancestartdate: insuranceStartController.text,
                            //   companyid: idController.text,
                            //   employeetype: group1Value.toString(),
                            // );
                            // var photo = AppCubit.get(context).photoimage;
                            // var iqama = AppCubit.get(context).iqamaphoto;

                            // var insurance =
                            //     AppCubit.get(context).insurancephoto;
                            // var file = AppCubit.get(context).fileupload;

                            // print(AppCubit.get(context).photoimage);
                            // print(AppCubit.get(context).iqamaphoto);
                            // // print(AppCubit.get(context).passportphoto);
                            // print(AppCubit.get(context).insurancephoto);
                            // print(AppCubit.get(context).fileupload);

                            AppCubit.get(context).addNewEmployee(
                              // name: usernameController.text,
                              // photo: FormData.fromMap({
                              //   "photo": await MultipartFile.fromFile(
                              //       AppCubit.get(context).photoimage.path,
                              //       filename: AppCubit.get(context)
                              //           .photoimage
                              //           .path
                              //           .split('/')
                              //           .last),

                              // }),
                              // iqamaphoto: FormData.fromMap({
                              //   "iqamaphoto": await MultipartFile.fromFile(
                              //       // AppCubit.get(context).iqamaphoto.path,
                              //       AppCubit.get(context).iqamaphoto.path,
                              //       filename: AppCubit.get(context)
                              //           .iqamaphoto
                              //           .path
                              //           .split('/')
                              //           .last),
                              // }),
                              // insurancephoto: FormData.fromMap({
                              //   "insurance_photo":
                              //       await MultipartFile.fromFile(
                              //           // AppCubit.get(context).insurancephoto.path,
                              //           AppCubit.get(context)
                              //               .insurancephoto
                              //               .path,
                              //           filename:
                              //               // AppCubit.get(context)
                              //               //     .insurancephoto
                              //               AppCubit.get(context)
                              //                   .insurancephoto
                              //                   .path
                              //                   .split('/')
                              //                   .last),
                              // }),
                              // contractfile: FormData.fromMap({
                              //   "contract_file": await MultipartFile.fromFile(
                              //       AppCubit.get(context).fileupload.path,
                              //       filename: AppCubit.get(context)
                              //           .fileupload
                              //           .path
                              //           .split('/')
                              //           .last),
                              // }),
                              // others: otherController.text,
                              // email: emailController.text,
                              // password: passwordController.text,
                              // phone: phoneController.text,
                              // salary: salaryController.text,
                              // workdayes: workingDayController.text,
                              // workstart: workingStartController.text,
                              // workend: workingEndController.text,
                              // iqamaenddate: idController.text,
                              // passportenddate: dateController.text,
                              // joiningdate: joiningController.text,
                              // contractdate: contractController.text,
                              // insuranceenddate: insuranceEndController.text,
                              // insurancestartdate:
                              //     insuranceStartController.text,
                              // companyid: idController.text,
                              // employeetype: group1Value == 0
                              //     ? "FullTime"
                              //     : group1Value == 1
                              //         ? "ParTime"
                              //         : "Regular"

                              FormData.fromMap({
                                "photo": await MultipartFile.fromFile(
                                    AppCubit.get(context).photoimage.path,
                                    filename: AppCubit.get(context)
                                        .photoimage
                                        .path
                                        .split('/')
                                        .last),
                                "name": usernameController.text,
                                "iqamaphoto": await MultipartFile.fromFile(
                                    // AppCubit.get(context).iqamaphoto.path,
                                    AppCubit.get(context).iqamaphoto.path,
                                    filename: AppCubit.get(context)
                                        .iqamaphoto
                                        .path
                                        .split('/')
                                        .last),
                                "insurance_photo": await MultipartFile.fromFile(
                                    // AppCubit.get(context).insurancephoto.path,
                                    AppCubit.get(context).insurancephoto.path,
                                    filename:
                                        // AppCubit.get(context)
                                        //     .insurancephoto
                                        AppCubit.get(context)
                                            .insurancephoto
                                            .path
                                            .split('/')
                                            .last),
                                "contract_file": await MultipartFile.fromFile(
                                    AppCubit.get(context).fileupload.path,
                                    filename: AppCubit.get(context)
                                        .fileupload
                                        .path
                                        .split('/')
                                        .last),
                                "others": otherController.text,
                                "email": emailController.text,
                                "password": passwordController.text,
                                "phone": phoneController.text,
                                "salary": salaryController.text,
                                "work_dayes": workingDayController.text,
                                "work_start": workingStartController.text,
                                "work_end": workingEndController.text,
                                "iqamaenddate": idController.text,
                                "passportenddate": dateController.text,
                                "joining_date": joiningController.text,
                                "contract_date": contractController.text,
                                "insurance_start_date":
                                    insuranceEndController.text,
                                "insurance_end_date":
                                    insuranceStartController.text,
                                "company_id": idController.text,
                                "employeetype": group1Value == 0
                                    ? "FullTime"
                                    : group1Value == 1
                                        ? "ParTime"
                                        : "Regular"
                              }),
                            );
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            navigateAndFinish(context, AddEmployee());
                          });
                        },
                        child: Text(
                          "Return To All Employee",
                          style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),

                  ////////////////////////////
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
