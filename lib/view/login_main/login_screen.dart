import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants.dart';
import 'package:project/view/layout/cubit/cubit.dart';
import 'package:project/view/layout/home_layout.dart';
import 'package:project/view/login_main/cubit/login_cubit.dart';
import 'package:project/view/login_main/cubit/login_states.dart';
import '../../shared/components.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              showToast(text: state.loginModel.msg, color: kGreenColor)
                  .then((value) {
                navigateToAndFinish(context, HomeLayout());
              });
            }
            showToast(text: state.loginModel.msg, color: kRedColor);
          }
        },
        builder: (context, state) {
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 29, vertical: 30),
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
                              AppLoginCubit.get(context).suffix,
                              color: Color(0xffDFDFDF),
                            ),
                            suffixFunction: () {
                              AppLoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            type: TextInputType.visiblePassword,
                            isPassword: AppLoginCubit.get(context).isPassword),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                              text: "Login",
                              onPressed: () {
                                AppLoginCubit.get(context).userLogin(
                                    userNameController.text,
                                    passwordController.text);
                              },
                              color: Color(0xffF2503E)),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
