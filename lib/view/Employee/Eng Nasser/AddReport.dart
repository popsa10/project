import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/shared/components.dart';
import 'package:project/view/Employee/Cubit/Cubit.dart';
import 'package:project/view/Employee/Cubit/States.dart';

class CreateReport extends StatefulWidget {
  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {
  String locationname;
  String tasksname;
  TextEditingController target = TextEditingController();
  TextEditingController achievement = TextEditingController();
  TextEditingController problem = TextEditingController();
  TextEditingController note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getLocation()
        ..getAllTasks(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: myCustomAppBar(
                  context: context,
                  title: 'Add Report',
                  canPop:  true,
                  haveBell:  true,
                  haveNotf: true),
              body: AppCubit.get(context).getAllLocation != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConditionalBuilder(
                              condition: state is! AppLoadingGetLocation,
                              builder: (context) {
                                var dropdownButton = DropdownButton(
                                  hint: Text(
                                      'Please choose a location                '),
                                  // Not necessary for Option 1
                                  value: locationname,
                                  onChanged: (newValue) {
                                    setState(() {
                                      locationname = newValue;
                                    });
                                  },
                                  items: AppCubit.get(context)
                                      .getAllLocation
                                      .locations
                                      .map((loc) {
                                    return DropdownMenuItem(
                                      child: new Text(loc.location),
                                      value: loc.location,
                                    );
                                  }).toList(),
                                  // value:locationname ,
                                );
                                return Container(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 65,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: dropdownButton,
                                );
                              },
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),

                            // TextField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //         borderSide: BorderSide(color: Colors.grey)),
                            //     labelText: "Select Location",
                            //   ),
                            // ),

                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: target,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: "Target",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: achievement,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: "Achievement",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: problem,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: "Problems",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Attach Photos (Optional)',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                uploadFile(function: () {
                                  AppCubit.get(context).uploadFileReport();
                                }),
                                SizedBox(
                                  width: 8,
                                ),
                                uploadFile(function: () {
                                  // AppCubit.get(context).uploadFileReport();
                                  AppCubit.get(context).addReport(
                                      locationid: 1,
                                      userid: 1,
                                      target: target.text,
                                      achievements: achievement.text,
                                      problems: problem.text,
                                      file1:
                                          AppCubit.get(context).fileAddReport,
                                      file2:
                                          AppCubit.get(context).fileAddReport2,
                                      file3:
                                          AppCubit.get(context).fileAddReport3,
                                      file4:
                                          AppCubit.get(context).fileAddReport4,
                                      taskid: 1,
                                      note: note.text);
                                })
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                uploadFile(function: () {
                                  AppCubit.get(context).uploadFileReport();
                                }),
                                SizedBox(
                                  width: 8,
                                ),
                                uploadFile(function: () {
                                  AppCubit.get(context).uploadFileReport();
                                })
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Task Report',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Stack(
                            //   alignment: Alignment.center,
                            //   children: <Widget>[
                            //     Container(
                            //       height: 80,
                            //     ),
                            //     Container(
                            //       height: 60,
                            //       margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                            //       padding: EdgeInsets.only(
                            //           bottom: 1, right: 1, left: 1),
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             color: Colors.grey, width: 1),
                            //         borderRadius: BorderRadius.circular(10),
                            //         shape: BoxShape.rectangle,
                            //       ),
                            //       child: Row(
                            //         children: [
                            //           Text(""),
                            //           Spacer(),
                            //           Icon(Icons.arrow_downward),
                            //           SizedBox(
                            //             width: 20,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //     Positioned(
                            //         left: 20,
                            //         top: 0,
                            //         child: Container(
                            //           padding: EdgeInsets.only(
                            //               bottom: 2, left: 2, right: 2),
                            //           color: Colors.white,
                            //           child: Text(
                            //             'Select Task',
                            //             style: TextStyle(
                            //                 color: Colors.black, fontSize: 15),
                            //           ),
                            //         )),
                            //     // Group: Group 1786
                            //   ],
                            // ),

                            ConditionalBuilder(
                              condition: state is! AppLoadingGetAllTasks,
                              builder: (context) {
                                var dropdownButton = DropdownButton(
                                  hint: Text(
                                      'Please choose a Tasks                '),
                                  // Not necessary for Option 1
                                  value: tasksname,
                                  onChanged: (newValue) {
                                    setState(() {
                                      tasksname = newValue;
                                    });
                                  },
                                  items: AppCubit.get(context)
                                      .allTasksModel
                                      .tasks
                                      .map((loc) {
                                    return DropdownMenuItem(
                                      child: new Text(loc.name),
                                      value: loc.name,
                                    );
                                  }).toList(),
                                  // value:locationname ,
                                );
                                return Container(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 65,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: dropdownButton,
                                );
                              },
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // ConditionalBuilder(
                            //   condition: state is! AppLoadingGetLocation,
                            //   builder: (context) {
                            //     var dropdownButton = DropdownButton(
                            //       hint: Text(
                            //           'Please choose a location                '),
                            //       // Not necessary for Option 1
                            //       value: locationname,
                            //       onChanged: (newValue) {
                            //         setState(() {
                            //           locationname = newValue;
                            //         });
                            //       },
                            //       items: AppCubit.get(context)
                            //           .getAllLocation
                            //           .locations
                            //           .map((loc) {
                            //         return DropdownMenuItem(
                            //           child: new Text(loc.location),
                            //           value: loc.location,
                            //         );
                            //       }).toList(),
                            //       // value:locationname ,
                            //     );
                            //     return Container(
                            //       width: MediaQuery.of(context).size.width - 20,
                            //       height: 50,
                            //       padding: EdgeInsets.all(12),
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10),
                            //           border: Border.all(color: Colors.grey)),
                            //       child: dropdownButton,
                            //     );
                            //   },
                            //   fallback: (context) =>
                            //       Center(child: CircularProgressIndicator()),
                            // ),

                            TextField(
                              controller: note,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: "Note",
                              ),
                            ),

                            // InkWell(
                            //   onTap: ()
                            //   {

                            //   },
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10),
                            //           borderSide: BorderSide(color: Colors.grey)),
                            //       labelText: "Select Location",
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Add Another Task',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.indigo),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 10,
                                        bottom: 10),
                                    child: InkWell(
                                      onTap: () async {
                                        //////// upload to server /////
                                        // AppCubit.get(context).postAddReport(
                                        //   FormData.fromMap({
                                        //     'location_id': 1,
                                        //     'user_id': 8,
                                        //     'target': target.text,
                                        //     'achievements': achievement.text,
                                        //     'problems': problem.text,
                                        //     'file1':
                                        //         await MultipartFile.fromFile(
                                        //             AppCubit.get(context)
                                        //                 .fileAddReport
                                        //                 .path,
                                        //             filename:
                                        //                 AppCubit.get(context)
                                        //                     .fileAddReport
                                        //                     .path
                                        //                     .split('/')
                                        //                     .last),
                                        //     'file2':
                                        //         await MultipartFile.fromFile(
                                        //             AppCubit.get(context)
                                        //                 .fileAddReport2
                                        //                 .path,
                                        //             filename:
                                        //                 AppCubit.get(context)
                                        //                     .fileAddReport2
                                        //                     .path
                                        //                     .split('/')
                                        //                     .last),
                                        //     'file3':
                                        //         await MultipartFile.fromFile(
                                        //             AppCubit.get(context)
                                        //                 .fileAddReport3
                                        //                 .path,
                                        //             filename:
                                        //                 AppCubit.get(context)
                                        //                     .fileAddReport3
                                        //                     .path
                                        //                     .split('/')
                                        //                     .last),
                                        //     'file4':
                                        //         await MultipartFile.fromFile(
                                        //             AppCubit.get(context)
                                        //                 .fileAddReport4
                                        //                 .path,
                                        //             filename:
                                        //                 AppCubit.get(context)
                                        //                     .fileAddReport4
                                        //                     .path
                                        //                     .split('/')
                                        //                     .last),
                                        //     'task_id': tasksname,
                                        //     'note': note.text,
                                        //   }),
                                        // );
                                      },
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          'Submit Report',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              const Color(0xFF293E4D),
                                              const Color(0xFF10181E)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }

  Widget uploadFile({Function function}) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1)),
          height: 100,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Upload  File'),
                SizedBox(
                  width: 4,
                ),
                Image.asset(
                  "assets/images/upload.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
