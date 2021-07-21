import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/view/layout/cubit/states.dart';
import 'package:project/view/layout_screens/attendence_screen.dart';
import 'package:project/view/layout_screens/vocation/vacations.dart';
import 'package:project/view/layout_screens/project/all_projects.dart';
import 'package:project/view/layout_screens/workflow/workflow_screen.dart';
import 'package:project/view/login_main/home_screen_manger.dart';
import 'package:project/view/login_main/home_screen_supervisor.dart';

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
    AttendenceScreen(),
    HomeScreenSupervisor(),
    ProjectsScreen(),
    VacationsScreen()
  ];
}
