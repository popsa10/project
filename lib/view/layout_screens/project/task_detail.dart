import 'package:flutter/material.dart';
import 'package:project/shared/ComponentButton.dart';

class TaskDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Task Details",
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Task Name", style: TextStyle(color: Colors.black)),
              Text(
                "Design Landscape",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text("Assigned Project", style: TextStyle(color: Colors.black)),
              Text(
                "New building",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text("Start Date", style: TextStyle(color: Colors.black)),
              Text(
                "6-jun-2021",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text("End Date", style: TextStyle(color: Colors.black)),
              Text(
                "16-jun-2021",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text("Task Admin", style: TextStyle(color: Colors.black)),
              Text(
                "Khaled Ali",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text("Assigned to", style: TextStyle(color: Colors.black)),
              Text(
                "Khaled Ali \n Salim Saied ",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
