import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/view/login_main/first_screen.dart';
import 'package:project/view/login_main/intro_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECC Erp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: Sizer(builder: (context, orientation, deviceType) => IntroScreen()),
    );
  }
}
