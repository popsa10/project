import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/model/AllEmployeeModel.dart';
import 'package:project/model/AllReports.dart';
import 'package:project/model/AllTasksModel.dart';
import 'package:project/model/AllVocationModel.dart';
import 'package:project/model/vehicle/GetAllLocation.dart';
import 'package:project/networks/remote/dio_helper.dart';
import 'package:project/view/Employee/Cubit/States.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  AllEmployeeModel getAllEmployee;

  void getallEmployee() {
    emit(AppLoadingAllEmployeeStates());
    DioHelper.postData(
            url: "All-Emploes", data: {'user_id': 1, 'company_id': 1})
        .then((value) => {
              getAllEmployee = AllEmployeeModel.fromJson(value.data),
              emit(AppScuessAllEmployeeStates()),
            })
        .catchError((onError) {
      print("Error $onError");
      print("Error ${onError.toString()}");
      emit(AppErrorAllEmployeeStates());
    });
  }

  void addNewEmployee(
    FormData formData, {
    String name,
    var photo,
    var iqamaphoto,
    // var passportphoto,
    var contractfile,
    var insurancephoto,
    String others,
    String email,
    String password,
    var phone,
    String permission,
    String workdayes,
    var salary,
    String workstart,
    String workend,
    var iqamaenddate,
    String passportenddate,
    String joiningdate,
    String contractdate,
    String insurancestartdate,
    String insuranceenddate,
    var companyid,
    String employeetype,
  }) {
    emit(AppLoadingADDEmployeeStates());
    DioHelper.postData(url: "Add-Employee", data: {
      'name': name,
      'photo': photo,
      'iqamaphoto': iqamaphoto,
      // 'passport_photo': passportphoto,
      'contract_file': contractfile,
      'insurance_photo': insurancephoto,
      'others': others,
      'password': password,
      'phone': phone,
      'permission': permission,
      'work_dayes': workdayes,
      'salary': salary,
      'work_start': workstart,
      'work_end': workend,
      'iqamaenddate': iqamaenddate,
      'passportenddate': passportenddate,
      'joining_date': joiningdate,
      'contract_date': contractdate,
      'insurance_start_date': insurancestartdate,
      'insurance_end_date': insuranceenddate,
      'company_id': companyid,
      'employeetype': employeetype,
    }).then((value) {
      emit(AppScuessADDEmployeeStates());
      print("Scuessssssssssssss");
      print(value.toString());
      getallEmployee();
    }).catchError((onError) {
      emit(AppErrorADDEmployeeStates());
      print("Error $onError");
    });
  }

///////   add tasks /////////////////////////////////////////////////////
  void addTasks(
      {String name,
      String users,
      String startdate,
      String enddate,
      String desription}) {
    DioHelper.postData(url: "Add-Task", data: {
      'name': name,
      'users': users,
      'start_date': startdate,
      'end_date': enddate,
      'desription': desription,
    }).then((value) {
      emit(AppScuessAddTasks());
      print("Scuesss Add Tasks ");
    }).catchError((onError) {
      emit(AppErrorAddTasks());
      print("Error Add Data");
      print("Error ${onError.toString()}");
    });
  }

  //////////////////////////////////////////////////          get allTasks ///////////
  AllTasksModel allTasksModel;
  void getAllTasks() {
    emit(AppLoadingGetAllTasks());
    DioHelper.getData(url: "All-Tasks/1").then((value) {
      allTasksModel = AllTasksModel.fromJson(value.data);
      emit(AppScuessGetAllTasks());
      print(allTasksModel.tasks.toString());
      print("ScuessGetAllTasks");
    }).catchError((onError) {
      emit(AppErrorGetAllTasks());

      print("onError ${onError.toString}");
      print("ErrorGetAllTasks");
    });
  }

///////////////////////////////////////////////////////////////      get AllVacationModel
  AllVacationModel allVacationModel;
  void getAllVacation() {
    emit(AppLoadingAllVacationModel());
    DioHelper.getData(url: "All-Vacation").then((value) {
      allVacationModel = AllVacationModel.fromJson(value.data);
      print(allVacationModel.vacations[0]);
      emit(AppScuessAllVacationModel());
    }).catchError((onError) {
      emit(AppErrorAllVacationModel());
    });
  }

  void acceptVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Accept-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      getAllVacation();
      print("accept Vactation");
    }).catchError((error) {
      print(error.toString());
      print("Error Vactation");
    });
  }

  void cancelVacation(userId, vacationId) {
    DioHelper.postData(
        url: "Cancel-Vacation",
        data: {"user_id": userId, "vacation_id": vacationId}).then((value) {
      print("Cancel Vactation");
      getAllVacation();
    }).catchError((error) {
      print(error.toString());
      print("Error Cancel");
    });
  }

////////////////////////////////////////////////////////////////////////// get allReports /////
  AllReports allReports;
  void getallReports() {
    emit(AppLoadingAllReports());
    DioHelper.getData(url: "All-Reports").then((value) {
      allReports = AllReports.fromJson(value.data);
      emit(AppScuessAllReports());
      print("Scuess Get All Reports ");
      print(value.toString());
    }).catchError((onError) {
      emit(AppErrorAllReports());
      print("Error Get All Reports ");
      print("${onError.toString()}");
    });
  }

  ///////// accept /////
  void acceptReport(reportid, userid) {
    DioHelper.postData(
        url: "Accept-Reports",
        data: {"report_id": reportid, "user_id": userid}).then((value) {
      emit(AppScuessAllReports());
      getallReports();
      print("Scuess accept  ");
    }).catchError((onError) {
      emit(AppErrorAllReports());
      print("Error accept ");
    });
  }
//////// cancel ///////

  void cancelReport(reportid, userid) {
    DioHelper.postData(
        url: "Cancel-Reports",
        data: {"report_id": reportid, "user_id": userid}).then((value) {
      emit(AppScuessAllReports());
      getallReports();
      print("Scuess Cancel ");
    }).catchError((onError) {
      emit(AppErrorAllReports());
      print("Error Cancel ");
    });
  }

///////////////////////////////////////////////////////// Add-- Report  ///// /
//////////
  // void postAddReport(FormData formData,
  //     {int locationid,
  //     int userid,
  //     String target,
  //     String achievements,
  //     String problems,
  //     var file1,
  //     var file2,
  //     var file3,
  //     var file4,
  //     int taskid,
  //     String note}) {
  //   DioHelper.postData(url: "Add-Report", data: {
  //     "location_id": locationid,
  //     "user_id": userid,
  //     "target": target,
  //     "achievements": achievements,
  //     "problems": problems,
  //     "file1": file1,
  //     "file2": file2,
  //     "file3": file3,
  //     "file4": file4,
  //     "task_id": taskid,
  //     "note": note,
  //   }).then((value) {
  //     emit(AppScuessPostAddReport());
  //     print(" Scuess Add Report ");
  //     print(value.toString());
  //     getallReports();
  //   }).catchError((onError) {
  //     emit(AppErrorPostAddReport());
  //     print(" Scuess Add Report ");
  //     print(onError.toString());
  //   });
  // }

  Future<void> addReport({
    locationid,
    userid,
    target,
    kilometer,
    achievements,
    problems,
    file1,
    file2,
    file3,
    file4,
    taskid,
    note,
  }) async {
    print("locationid = $locationid");
    print("userid = $userid");
    print("target = $target");
    print("kilometer = $kilometer");
    print("achievements == $achievements");
    print("problems == $problems");
    print("file1 == $file1");
    print("file2 == $file2");
    print("file3 == $file3");
    print("file4 == $file4");
    print("taskid == $taskid");

    FormData formData = FormData.fromMap({
      "location_id": locationid,
      "user_id": userid,
      "target": target,
      "achievements": achievements,
      "problems": problems,
      "file1": file1 != null
          ? await MultipartFile.fromFile(file1.path,
              filename: file1.path.split('/').last)
          : "",
      "file2": file2 != null
          ? await MultipartFile.fromFile(file2.path,
              filename: file2.path.split('/').last)
          : "",
      "file3": file3 != null
          ? await MultipartFile.fromFile(file3.path,
              filename: file3.path.split('/').last)
          : "",
      "file4": file4 != null
          ? await MultipartFile.fromFile(file4.path,
              filename: file4.path.split('/').last)
          : "",
      "task_id": taskid,
      "note": note,

      // "car_photo": carPhoto!=null? await MultipartFile.fromFile(carPhoto.path, filename: carPhoto.path.split('/').last):"",
      // "insurance_photo": insurancePhoto!=null? await MultipartFile.fromFile(insurancePhoto.path, filename: insurancePhoto.path.split('/').last):"",
      // "license_photo": licensePhoto!=null? await MultipartFile.fromFile(licensePhoto.path, filename: licensePhoto.path.split('/').last):"",
    });

    DioHelper.postData(url: "Add-Vehicles", data: formData).then((value) {
      print(value.data);
      getallReports();
    }).catchError((error) {
      print(error.toString());
    });
  }

/////////////////////////////////////////////////////////////////
  //////////////get location ////
  GetAllLocation getAllLocation;
  void getLocation() {
    DioHelper.getData(url: "All-Location").then((value) {
      emit(AppLoadingGetLocation());
      getAllLocation = GetAllLocation.fromJson(value.data);
      emit(AppScuessGetLocation());
      print(value.data);
      print("Scuess Get Location");
    }).catchError((onError) {
      emit(AppErrorGetLocation());
      print(onError.data);
      print("Scuess Get Location");
    });
  }

  //////////////
  File fileAddReport;
  File fileAddReport2;
  File fileAddReport3;
  File fileAddReport4;

  Future<void> uploadFileReport() async {
    await FilePicker.platform.pickFiles().then((value) {
      fileAddReport = File(value.files.single.path);
      fileAddReport2 = File(value.files.single.path);
      fileAddReport3 = File(value.files.single.path);
      fileAddReport4 = File(value.files.single.path);
      emit(AppScuessUploadStates());
    }).catchError((onError) {
      print('No File selected.');
      emit(AppErrorUploadStates());
    });
  }

//////// ///////  Send Note  //////////////////////////////////////////////
  Future sendNote(String notes, String employee) {
    return DioHelper.postData(
        url: "Send-notifications",
        data: {"notes": notes, "employee": employee}).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

////////
  /////////////////////////////
  File photoimage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    await picker.getImage(source: ImageSource.gallery).then((value) {
      photoimage = File(value.path);
      emit(AppScuessProfileImageStates());
    }).catchError((onError) {
      print('No image selected.');
      emit(AppErrorProfileImageStates());
    });
  }

  /////////////////////// iqamaphoto ////////
  File iqamaphoto;
  var picker1 = ImagePicker();
  Future<void> getiqamaphotoImage() async {
    final pickedFile = await picker1.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      iqamaphoto = File(pickedFile.path);
      emit(AppScuessProfile1ImageStates());
    } else {
      print('No image selected.');
      emit(AppErrorProfile1ImageStates());
    }
  }

  /////////////////////// passport_photo ////////
  File passportphoto;
  var picker2 = ImagePicker();
  Future<void> getpassportphotoImage() async {
    final pickedFile = await picker2.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      passportphoto = File(pickedFile.path);
      emit(AppScuessProfile2ImageStates());
    } else {
      print('No image selected.');
      emit(AppErrorProfile2ImageStates());
    }
  }

  ////////////////////////////////// insurance_photo
  File insurancephoto;
  var picker3 = ImagePicker();
  Future<void> getinsurancephotoImage() async {
    final pickedFile = await picker2.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      insurancephoto = File(pickedFile.path);
      emit(AppScuessProfile3ImageStates());
    } else {
      print('No image selected.');
      emit(AppErrorProfile3ImageStates());
    }
  }

  File fileupload;

  Future<void> uploadFile() async {
    await FilePicker.platform.pickFiles().then((value) {
      fileupload = File(value.files.single.path);
      emit(AppScuessUploadStates());
    }).catchError((onError) {
      print('No File selected.');
      emit(AppErrorUploadStates());
    });

    // if (result != null) {
    //   fileupload = File(result.files.single.path);
    //   emit(AppScuessUploadStates());
    // } else {

    // User canceled the picker
    //
  }
}
