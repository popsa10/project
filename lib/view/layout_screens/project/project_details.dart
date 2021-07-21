import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/details_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/employees_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/invoices_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/tasks_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/vehicles_tab.dart';

class ProjectDetails extends StatelessWidget {
  ProjectDetails({Key key}) : super(key: key);
  final List<Widget> tabs = [
    Text("Details"),
    Text("Employees"),
    Text("Vehicles"),
    Text("Tasks"),
    Text("Invoices"),
  ];

  final List<Widget> screens = [
    DetailsScreen(),
    EmployeesScreen(),
    VehiclesScreen(),
    TasksScreen(),
    InvoicesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "New building Project", search: false),
        body: DefaultTabController(
          initialIndex: 0,
          length: tabs.length,
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: tabs,
                labelColor: kTitleColor,
                physics: BouncingScrollPhysics(),
                indicatorColor: kRedColor,
                isScrollable: true,
                labelPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                unselectedLabelColor: kGreyColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[200],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: screens,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
