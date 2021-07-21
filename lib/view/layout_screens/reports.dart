import 'package:flutter/material.dart';
import 'package:project/shared/defaults.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mycustomAppbar(
          title: 'Reports',
          context: context,
          search: true,
          haveNotf: true,
          havebell: true,
          canpop: true,
          toolbarHeight: 130),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,right: 30,left: 30),
            child: defaultButton(text: 'Add Report',onPressed: (){},color: Color(0xFF293E4D)),
          ),
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime(2020),
                    currentDate: DateTime.now(),
                    lastDate: DateTime(2050),
                    firstDate: DateTime(2015),
                  );
                },
                child: Container(
                  height: 50,

                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("s "),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 50,
                  top: 12,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 2, left: 2, right: 2),
                    color: Colors.white,
                    child: Text(
                      'Select  Date Range',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  )),
              // Group: Group 1786
            ],
          ),
        ],
      ),
    );
  }
}
