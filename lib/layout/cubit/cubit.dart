import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/cubit/states.dart';
import 'package:project/view/layout_screens/attendence_screen.dart';
import 'package:project/view/layout_screens/home/home_screen.dart';
import 'package:project/view/layout_screens/vacations.dart';
import 'package:project/view/layout_screens/project/all_projects.dart';
import 'package:project/view/layout_screens/workflow/workflow_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  void changeNavBar(int value) {
    currentIndex = value;
    emit(ChangeNavBarState());
  }

  List<Widget> screens = [
    WorkflowScreen(),
    const AttendenceScreen(),
    const HomeScreen(),
    ProjectsScreen(),
    const VacationsScreen()
  ];
}
