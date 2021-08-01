import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/location/all_location_model.dart';
import 'package:project/model/vehicle/add_maintenance_model.dart';
import 'package:project/model/all_employees.dart';
import 'package:project/model/all_projects_model.dart';
import 'package:project/model/notifications/all_notifications_model.dart';
import 'package:project/model/vacation/all_vacation_model.dart';
import 'package:project/model/vacation/paid_vacation_model.dart';
import 'package:project/model/vehicle/all_maintenance-model.dart';
import 'package:project/model/vehicle/vehicle_model.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:project/networks/remote/end_points.dart';
import 'package:project/shared/cubit/app_states.dart';
import 'package:project/view/attendence/attendence_screen.dart';
import 'package:project/view/login_main/home_screen_manger.dart';
import 'package:project/view/project/all_projects.dart';
import 'package:project/view/vocation/vacations.dart';
import 'package:project/view/workflow/workflow_screen.dart';

import '../../constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // AllTasks allTasks;
  // void getAllTasks() {
  //   emit(GetAllTasksLoadingState());
  //   DioHelper.getData(url: ALLTASKS).then((value) {
  //     allTasks = AllTasks.fromJson(value.data);
  //     emit(GetAllTasksSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetAllTasksErrorState());
  //   });
  // }

  int currentIndex = 2;
  void changeNavBar(int value) {
    currentIndex = value;
    emit(ChangeNavBarState());
  }

  List<Widget> screens = [
    WorkflowScreen(),
    AttendenceScreen(),
    HomeScreen(),
    ProjectsScreen(),
    VacationsScreen()
  ];

  void createNewTask(
      {String name,
      users,
      String startDate,
      String endDate,
      int ProjectId,
      String description}) {
    DioHelper.postData(url: "Add-Task", data: {
      "name": name,
      "users": users,
      "start_date": startDate,
      "end_date": endDate,
      "desription": description,
      "project_id": ProjectId
    }).then((value) {
      print(value.data);
      getAllProjects();
      emit(CreateNewTaskSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateNewTaskErrorState());
    });
  }

  Future<void> addProject({
    @required name,
    @required type,
    @required start_date,
    @required end_date,
    @required deadline,
    @required location_id,
    @required schedual_link,
    @required contract_link,
    @required task_creator,
    @required employees,
    @required vehicles,
    @required photo,
    @required notes,
    @required value,
    @required invoices_no,
  }) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "type": type,
      "start_date": start_date,
      "end_date": end_date,
      "deadline": deadline,
      "location_id": location_id,
      "schedual_link": schedual_link,
      "contract_link": contract_link,
      "task_creator": task_creator,
      "employees": employees,
      "user_id": userId,
      "vehicles": vehicles,
      "notes": notes,
      "photo": photo,
      "value": value,
      "invoices_no": invoices_no,
    });
    DioHelper.postData(url: "Add-Project", token: token, data: formData)
        .then((value) {
      print(value.data);
      getAllProjects();
    }).catchError((error) {
      print(error.toString());
    });
  }

  AllVehicleModel allVehicles;
  getAllVehicles() {
    emit(GetAllVehiclesLoadingState());
    return DioHelper.getData(
      url: "All-Vehicles",
    ).then((value) {
      allVehicles = AllVehicleModel.fromJson(value.data);
      print(value.data);
      emit(GetAllVehiclesSuccessState());
    }).catchError((error) {
      emit(GetAllVehiclesErrorState());
    });
  }

  Future<void> addVehicle(
      {@required name,
      @required number,
      @required model,
      @required kilometer,
      @required insuranceDateStart,
      @required insuranceDateEnd,
      @required licenseNumber,
      @required driverLicense,
      @required licenseDateEnd,
      @required examinationDate,
      @required userId,
      @required locations,
      @required notes,
      @required carPhoto,
      @required insurancePhoto,
      @required licensePhoto,
      @required status}) async {
    print("insuranceDateStart = ${insuranceDateStart}");
    print("examinationDate = ${examinationDate}");
    print("licenseDateEnd = ${licenseDateEnd}");
    print("insuranceDateEnd = ${insuranceDateEnd}");
    print("name == $name");
    print("number == $number");
    print("model == $model");
    print("kilometer == $kilometer");
    print("licenseNumber == $licenseNumber");
    print("driverLicense == $driverLicense");
    print("userId == $userId");
    print("locations == $locations");
    print("notes == $locations");
    print("status == $status");

    FormData formData = FormData.fromMap({
      "name": name,
      "number": number,
      "model": model,
      "kilometer": kilometer,
      "insurance_date_start": insuranceDateStart,
      "insurance_date_end": insuranceDateEnd,
      "license_number": licenseNumber,
      "driver_license": driverLicense,
      "license_date_end": licenseDateEnd,
      "examination_date": examinationDate,
      "user_id": userId,
      "locations": locations,
      "notes": notes,
      "status": status,
    });

    DioHelper.postData(url: "Add-Vehicles", token: token, data: formData)
        .then((value) {
      print(value.data);
      getAllVehicles();
    }).catchError((error) {
      print(error.toString());
    });
  }

  void deleteVehicle(vehicleId) {
    DioHelper.getData(url: "Delete-Vehicles/${vehicleId}").then((value) {
      print(value.toString());
      getAllVehicles();
    }).catchError((error) {
      print(error.toString());
    });
  }

  AllProjectModel allProject;
  getAllProjects() {
    emit(GetAllProjectLoadingState());
    DioHelper.getData(url: "All-Project").then((value) {
      allProject = AllProjectModel.fromJson(value.data);
      emit(GetAllProjectSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllProjectErrorState());
    });
  }

  AllMaintenanceModel maintenanceModel;
  void getAllMaintenance(vehicleId, userId) {
    emit(GetAllMaintenanceLoadingState());
    DioHelper.getData(url: "all-Maintaincess/$vehicleId/$userId").then((value) {
      maintenanceModel = AllMaintenanceModel.fromJson(value.data);
      emit(GetAllMaintenanceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllMaintenanceErrorState());
    });
  }

  void deleteTask(taskId) {
    DioHelper.getData(url: "Delete-Task/${taskId}").then((value) {
      print(value.data);
      getAllProjects();
    }).catchError((error) {
      print(error.toString());
    });
  }

  AddMaintenanceModel addMaintenanceModel;
  void addMaintenance({
    description,
    userId,
    vehicleId,
    date,
  }) {
    DioHelper.postData(url: "add-Maintaincess", data: {
      "decription": description,
      "user_id": userId,
      "vichel_id": vehicleId,
      "date": date,
    }).then((value) {
      addMaintenanceModel = AddMaintenanceModel.fromJson(value.data);
      getAllMaintenance(vehicleId, userId);
      emit(AddMaintenanceSuccessState(addMaintenanceModel));
    }).catchError((error) {
      print(error.toString());
      emit(AddMaintenanceErrorState());
    });
  }

  VacationModel vacationModel;
  void getAllVacations() {
    emit(GetAllVehiclesLoadingState());
    DioHelper.getData(url: "All-Vacation").then((value) {
      vacationModel = VacationModel.fromJson(value.data);
      emit(GetAllVehiclesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllVehiclesErrorState());
    });
  }

  PaidVacationModel paidVacationModel;
  void getPaidVacation() {
    emit(GetPaidVacationLoadingState());
    DioHelper.getData(url: "Paid-Vacation").then((value) {
      paidVacationModel = PaidVacationModel.fromJson(value.data);
      emit(GetPaidVacationSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPaidVacationErrorState());
    });
  }

  void acceptVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Accept-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      getAllVacations();
    }).catchError((error) {
      print(error.toString());
    });
  }

  void cancelVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Cancel-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      getAllVacations();
    }).catchError((error) {
      print(error.toString());
    });
  }

  AllNotificationModel allNotificationModel;
  void getAllNotification() {
    DioHelper.getData(url: "All-notifications").then((value) {
      allNotificationModel = AllNotificationModel.fromJson(value.data);
      emit(GetAllNotificationSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllNotificationErrorState());
    });
  }

  Future sendNote(String notes, String employee) {
    return DioHelper.postData(
        url: "Send-notifications",
        data: {"notes": notes, "employee": employee}).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  Future<AllEmployeesModel> getEmployees() async {
    AllEmployeesModel allEmployees;
    emit(GetAllEmployeesLoadingState());
    Response response = await DioHelper.postData(
        url: "All-Emploes",
        token: token,
        data: {"user_id": 1, "company_id": 1});
    print(response.data);
    allEmployees = AllEmployeesModel.fromJson(response.data);
    return allEmployees;
  }

  Future<AllLocationsModel> getLocations() async {
    AllLocationsModel allLocations;
    emit(GetAllEmployeesLoadingState());

    Response response = await DioHelper.getData(
      url: "All-Location",
      token: token,
    );
    // print("response.body");
    // http.Response response = await http.post(Uri.parse("https://active4web.com/ECC/api/All-Emploes"),body: {"user_id": userId, "company_id": companyId},headers: {"Authorization": token ?? "",
    //   "Content-Type": "application/json"});
    print(response.data);
    allLocations = AllLocationsModel.fromJson(response.data);
    print("uuuuuuuuu${allLocations.msg}");
    return allLocations;
  }
}
