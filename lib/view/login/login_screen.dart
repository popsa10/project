import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:project/constants.dart';
import 'package:project/layout/home_layout.dart';
import '../../shared/components.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: Center(
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                width: 188,
                height: 199,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: defaultText(
                  text: "ECC staff login",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 23)),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30),
                    topEnd: Radius.circular(30),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(
                          text: "Username",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 5,
                      ),
                      defaultFormField(
                          hintText: "Username",
                          controller: userNameController,
                          suffix: Image.asset(
                            "assets/images/user.png",
                            height: 1,
                          ),
                          validate: () {},
                          type: TextInputType.visiblePassword,
                          isPassword: false),
                      const SizedBox(
                        height: 27,
                      ),
                      defaultText(
                          text: "Password",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 5,
                      ),
                      defaultFormField(
                          hintText: "Password",
                          controller: passwordController,
                          suffix: Icon(
                            Icons.visibility,
                            color: Color(0xffDFDFDF),
                          ),
                          validate: () {},
                          type: TextInputType.visiblePassword,
                          isPassword: true),
                      const SizedBox(
                        height: 30,
                      ),
                      defaultButton(
                          text: "Login",
                          onPressed: () {
                            navigateTo(context, const HomeLayout());
                          },
                          height: 62,
                          color: const Color(0xffF2503E))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
