import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/cubit/states.dart';
import 'package:project/view/layout_screens/attendence_screen.dart';
import 'package:project/view/layout_screens/home_screen.dart';
import 'package:project/view/layout_screens/more_screen.dart';
import 'package:project/view/layout_screens/projects_screen.dart';
import 'package:project/view/workflow_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  String currentPage = "HomeScreen";
  List<String> pageKeys = [
    "WorkflowScreen",
    "AttendenceScreen",
    "HomeScreen",
    "ProjectsScreen",
    "MoreScreen"
  ];
  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    "WorkflowScreen": GlobalKey<NavigatorState>(),
    "AttendenceScreen": GlobalKey<NavigatorState>(),
    "HomeScreen": GlobalKey<NavigatorState>(),
    "ProjectsScreen": GlobalKey<NavigatorState>(),
    "MoreScreen": GlobalKey<NavigatorState>(),
  };

  int currentIndex = 2;

  void changeNavBar(int value) {
    currentIndex = value;
    currentPage = pageKeys[value];
    emit(ChangeNavBarState());
  }

  List<Widget> screens = [
    WorkflowScreen(),
      AttendenceScreen(),
    const HomeScreen(),
    const ProjectsScreen(),
    const MoreScreen()
  ];

  Widget pageToView() {

    return Navigator(
      key: navigatorKeys[currentIndex],
      onGenerateRoute: (route) {
        return MaterialPageRoute(builder: (context) => screens[currentIndex]);
      },
    );
  }

  Widget buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    Widget child = cubit.screens[2];
    if (tabItem == "WorkflowScreen")
      child = cubit.screens[0];
    else if (tabItem == "AttendenceScreen")
      child = cubit.screens[1];
    else if (tabItem == "HomeScreen")
      child = cubit.screens[2];
    else if (tabItem == "ProjectsScreen")
      child = cubit.screens[3];
    else if (tabItem == "MoreScreen") child = cubit.screens[4];

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
