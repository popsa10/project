import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/view/layout/home_layout.dart';
import '../../shared/components.dart';
import 'home_screen_supervisor.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                width: size.width * 0.6,
                height: size.height * 0.5,
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
          Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(30),
                  topEnd: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 30),
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
                  customTextFormField(
                      hintText: "Username",
                      controller: userNameController,
                      suffix: Image.asset("assets/images/user.png",
                          color: Color(0xffDFDFDF)),
                      validate: () {},
                      type: TextInputType.name,
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
                  customTextFormField(
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
                        navigateTo(context, HomeLayout());
                      },
                      color: Color(0xffF2503E))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
