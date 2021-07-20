import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';

import '../../constants.dart';
import 'details.dart';
import 'maintainance_screen.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({Key key}) : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails>
    with TickerProviderStateMixin {
  List<Widget> screens = [Details(), MaintainanceScreen()];
  List<Widget> tabs = [
    Text("Details"),
    Text("Maintainance"),
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return Scaffold(
        appBar: CustomAppBar(
          title: "Toyota 15",
          search: false,
        ),
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
