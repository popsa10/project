import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';

class CreateNewVehicles extends StatelessWidget {
  const CreateNewVehicles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Vehicles",
        search: false,
      ),
    );
  }
}
