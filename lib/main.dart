import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants.dart';
import 'package:project/layout/cubit/cubit.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/view/intro_screen.dart';
import 'package:project/view/layout_screens/attendence_screen.dart';
import 'package:project/view/layout_screens/locations_screen.dart';
import 'package:project/view/layout_screens/payroll_screen.dart';
import 'package:project/view/layout_screens/reduction_screen.dart';
import 'package:project/view/layout_screens/reports.dart';
import 'package:sizer/sizer.dart';

import 'view/layout_screens/add_location.dart';
import 'view/layout_screens/attendance1.dart';
import 'view/layout_screens/create_report.dart';
import 'view/layout_screens/detuction_list.dart';
import 'view/layout_screens/payroll _sheet_1.dart';
import 'view/layout_screens/report_details.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: kSecondaryColor),
        home: Sizer(builder: (context, orientation, deviceType) {
          return    Attendance1(); //IntroScreen();
        }));
  }
}
