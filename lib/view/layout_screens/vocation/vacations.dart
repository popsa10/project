import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/layout_screens/vocation/paid_vacations_screen.dart';
import 'package:project/view/layout_screens/vocation/vacation_request_screen.dart';
import '../../../constants.dart';

class VacationsScreen extends StatelessWidget {
  VacationsScreen({Key key}) : super(key: key);
  List<Widget> screens = [VocationRequestScreen(), PaidVocationScreen()];
  List<Widget> tabs = [
    Text("Vocation Request"),
    Text("Paid Vocations"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Vocations",
          search: true,
        ),
        body: DefaultTabController(
          length: tabs.length,
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
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
