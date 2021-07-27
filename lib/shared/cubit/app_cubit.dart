import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/model/all_projects_model.dart';
import 'package:project/model/all_tasks_model.dart';
import 'package:project/model/vehicle_model.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:project/networks/remote/end_points.dart';
import 'package:project/shared/cubit/app_states.dart';

import '../../constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  AllTasks allTasks;
  void getAllTasks() {
    emit(GetAllTasksLoadingState());
    DioHelper.getData(url: ALLTASKS).then((value) {
      allTasks = AllTasks.fromJson(value.data);
      print(allTasks.tasks.length);
      emit(GetAllTasksSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllTasksErrorState());
    });
  }

  void createNewTask(
      {String name,
      String users,
      String startDate,
      String endDate,
      String description}) {
    DioHelper.postData(url: ADDTASK, data: {
      "name": name,
      "users": users,
      "start_date": startDate,
      "end_date": endDate,
      "desription": description,
    }).then((value) {
      emit(CreateNewTaskSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateNewTaskErrorState());
    });
  }

  void createNewProject({
    String name,
    String type,
    String startDate,
    String endDate,
    String deadline,
    String locationId,
    String schedualLink,
    String contractLink,
    String taskCreator,
    String employees,
    String vehicles,
    String notes,
    String photo,
    String projectId,
  }) {
    DioHelper.postData(url: ADDPROJECT, data: {
      "name": name,
      "type": type,
      "start_date": startDate,
      "end_date": endDate,
      "deadline": deadline,
      "location_id": locationId,
      "schedual_link": schedualLink,
      "contract_link": contractLink,
      "task_creator": taskCreator,
      "employees": employees,
      "vehicles": vehicles,
      "notes": notes,
      "photo": photo,
      "project_id": projectId,
    }).then((value) {
      emit(CreateNewProjectSuccessState());
    }).catchError((error) {
      emit(CreateNewProjectErrorState());
    });
  }

  AllEmployees allEmployees;
  void getAllEmployees() {
    emit(GetAllEmployeesLoadingState());
    DioHelper.postData(
        url: "All-Emploes",
        token: token,
        data: {"user_id": "1", "company_id": "1"}).then((value) async {
      allEmployees = await AllEmployees.fromJson(value.data);
      print(allEmployees.data.status);
      emit(GetAllEmployeesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllEmployeesErrorState());
    });
  }

  AllVehicleModel allVehicles;
  void getAllVehicles() {
    emit(GetAllVehiclesLoadingState());
    DioHelper.getData(
      url: "All-Vehicles",
    ).then((value) {
      allVehicles = AllVehicleModel.fromJson(value.data);
      emit(GetAllVehiclesSuccessState());
    }).catchError((error) {
      emit(GetAllVehiclesErrorState());
    });
  }

  AllProjectModel allProject;
  void getAllProjects() {
    emit(GetAllProjectLoadingState());
    DioHelper.getData(url: "All-Project").then((value) {
      allProject = AllProjectModel.fromJson(value.data);
      print(allProject.msg);
      emit(GetAllProjectSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllProjectErrorState());
    });
  }
}
