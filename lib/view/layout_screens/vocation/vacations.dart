import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/vocation/paid_vacations_screen.dart';
import 'package:project/view/layout_screens/vocation/vacation_request_screen.dart';
import '../../../constants.dart';

class VacationsScreen extends StatefulWidget {
  const VacationsScreen({Key key}) : super(key: key);

  @override
  State<VacationsScreen> createState() => _VacationsScreenState();
}

class _VacationsScreenState extends State<VacationsScreen>
    with TickerProviderStateMixin {
  List<Widget> screens = [VocationRequestScreen(), PaidVocationScreen()];
  List<Widget> tabs = [
    Text("Vocation Request"),
    Text("Paid Vocations"),
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return Scaffold(
        appBar: CustomAppBar(
          title: "Vocations",
          search: true,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              controller: tabController,
              tabs: tabs,
              labelColor: kTitleColor,
              physics: BouncingScrollPhysics(),
              indicatorColor: kRedColor,
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
        ));
  }
}
