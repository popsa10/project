import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/details_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/employees_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/invoices_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/tasks_tab.dart';
import 'package:project/view/layout_screens/project/project_tabbarview/vehicles_tab.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({Key key}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails>
    with TickerProviderStateMixin {
  List<Widget> tabs = [
    Text("Details"),
    Text("Employees"),
    Text("Vehicles"),
    Text("Tasks"),
    Text("Invoices"),
  ];

  List<Widget> screens = [
    DetailsScreen(),
    EmployeesScreen(),
    VehiclesScreen(),
    TasksScreen(),
    InvoicesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: CustomAppBar(title: "New building Project", search: false),
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              controller: tabController,
              tabs: tabs,
              labelColor: kTitleColor,
              physics: BouncingScrollPhysics(),
              indicatorColor: kRedColor,
              isScrollable: true,
              padding: EdgeInsets.only(
                top: 15,
              ),
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
              controller: tabController,
              children: screens,
            ))
          ],
        ),
      ),
    );
  }
}
