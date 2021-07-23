import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import '../../constants.dart';
import 'details.dart';
import 'maintainance_screen.dart';

class VehicleDetails extends StatelessWidget {
  VehicleDetails({Key key}) : super(key: key);
  List<Widget> screens = [Details(), MaintainanceScreen()];
  List<Widget> tabs = [
    Text("Details"),
    Text("Maintenance"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Toyota 15",
          search: false,
        ),
        body: DefaultTabController(
          initialIndex: 0,
          length: tabs.length,
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                tabs: tabs,
                labelColor: kTitleColor,
                physics: BouncingScrollPhysics(),
                indicatorColor: kRedColor,
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
        ));
  }
}
