import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants.dart';
import 'package:project/shared/components.dart';
import 'package:project/shared/cubit/app_cubit.dart';
import 'package:project/shared/cubit/app_states.dart';

class HomeLayout extends StatelessWidget {
  int currentIndex;
  HomeLayout({Key key, this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              bottomNavigationBar: customNavigationBar(
                  currentIndex: cubit.currentIndex, cubit: cubit),
              body: cubit.screens[cubit.currentIndex]);
        },
      ),
    );
  }
}
