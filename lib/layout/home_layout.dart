import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/cubit/cubit.dart';
import 'cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                final isFirstRouteInCurrentTab = !await cubit
                    .navigatorKeys[cubit.currentPage]!.currentState!
                    .maybePop();
                if (isFirstRouteInCurrentTab) {
                  if (cubit.currentPage != "HomeScreen") {
                    cubit.changeNavBar(2);

                    return false;
                  }
                }
                // let system handle back button if we're on the first route
                return isFirstRouteInCurrentTab;
              },
              child: Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                      backgroundColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      selectedLabelStyle: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.normal),
                      currentIndex: cubit.currentIndex,
                      selectedItemColor: Colors.black,
                      onTap: (value) {
                        cubit.changeNavBar(value);
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Image.asset(
                                  "assets/images/workflow (1).png",
                                  width: 17.5),
                            ),
                            label: "workflow"),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Image.asset(
                                "assets/images/event-1.png",
                                width: 17.5,
                              ),
                            ),
                            label: "Attendance"),
                        BottomNavigationBarItem(
                          label: "",
                          icon: FloatingActionButton(
                            onPressed: () {
                              cubit.changeNavBar(2);
                            },
                            child: Image.asset("assets/images/Add.png"),
                          ),
                        ),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Image.asset(
                                "assets/images/layer.png",
                                width: 17.5,
                              ),
                            ),
                            label: "Projects"),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Image.asset(
                                "assets/images/dashboard-interface (1).png",
                                width: 17.5,
                              ),
                            ),
                            label: "More"),
                      ]),
                  body: Stack(children: <Widget>[
                    cubit.buildOffstageNavigator("WorkflowScreen"),
                    cubit.buildOffstageNavigator("AttendenceScreen"),
                    cubit.buildOffstageNavigator("HomeScreen"),
                    cubit.buildOffstageNavigator("ProjectsScreen"),
                    cubit.buildOffstageNavigator("MoreScreen"),
                  ]) // cubit.pageToView(  )//[cubit.currentIndex]//cubit.screens[cubit.currentIndex]

                  ),
            );
          },
        ),
      ),
    );
  }
}
