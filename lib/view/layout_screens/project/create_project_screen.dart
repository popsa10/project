import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create Project",
        search: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
