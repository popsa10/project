import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';

import 'login/login_screen.dart';

class IntroScreen extends StatelessWidget {
  static String id = "Intro Screen";
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/First Screen – 1.png",
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: defaultButton(
                  text: "Login",
                  onPressed: () {
                    navigateTo(context, LoginScreen());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
