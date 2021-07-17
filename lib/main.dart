import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants.dart';
import 'package:project/layout/cubit/cubit.dart';
import 'package:project/shared/bloc_observer.dart';
import 'package:project/view/intro_screen.dart';
import 'package:sizer/sizer.dart';

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
          return const IntroScreen();
        }));
  }
}
