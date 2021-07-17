import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {},
              children: [
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        leading: Image.asset("assets/images/Group 69796.png"),
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
