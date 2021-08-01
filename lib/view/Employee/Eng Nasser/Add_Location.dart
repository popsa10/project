import 'package:flutter/material.dart';
import 'package:project/shared/ComponentButton.dart';

class AddLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mycustomAppbar(
        context: context,
        title: 'Locations',
        search: false,
        haveNotf: true,
        havebell: true,
        canpop: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Location',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: "Location Title",
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                      labelText: "Location Title",
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/images/Group 1894.png"),
                ),
              ],
            ),
            Spacer(),
            defaultButton(
              onPressed: () {},
              text: 'Save Location',
              background: const Color(0xFF293E4D),
            )
          ],
        ),
      ),
    );
  }
}
