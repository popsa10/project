import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/login_model.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:project/networks/remote/end_points.dart';
import 'login_states.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(InitialLoginState());
  static AppLoginCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel;
  void userLogin(String name, String password) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {"name": name, "password": password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.status);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginPasswordState());
  }
}
