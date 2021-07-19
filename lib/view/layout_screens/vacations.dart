import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VacationsScreen extends StatelessWidget {
  const VacationsScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {},
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        leading: Image.asset(
                          "assets/images/Group 69796.png",
                          height: 20.h,
                        ),
                        title: Text("HR"),
                      );
                    },
                    body: ListTile())
              ],
            )
          ],
        ),
      ),
    );
  }
}
