// import 'package:flutter/material.dart';
//
// class MenuHome extends StatefulWidget {
//   @override
//   _MenuHomeState createState() => _MenuHomeState();
// }
//
// class _MenuHomeState extends State<MenuHome> {
//   final GlobalKey expansionTile = new GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               children: [
//                 close(),
//                 expansitionTItle(
//                     image: "assets/images/Group 69796.png",
//                     text: "Hr",
//                     column: Column(
//                       children: [
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location")
//                       ],
//                     )),
//                 expansitionTItle(
//                     image: "assets/images/Group -81.png",
//                     text: "Projects",
//                     column: Column(
//                       children: [
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location")
//                       ],
//                     )),
//                 expansitionTItle(
//                     image: "assets/images/Group 69808.png",
//                     text: "WorkFlow",
//                     column: Column(
//                       children: [
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location")
//                       ],
//                     )),
//                 expansitionTItle(
//                     image: "assets/images/Group 69806.png",
//                     text: "Finance",
//                     column: Column(
//                       children: [
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location")
//                       ],
//                     )),
//                 expansitionTItle(
//                     image: "assets/images/Group 69811.png",
//                     text: "Purchasing",
//                     column: Column(
//                       children: [
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location")
//                       ],
//                     )),
//                 expansitionTItle(
//                     image: "assets/images/Group 69815.png",
//                     text: "Reports",
//                     column: Column(
//                       children: [
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location")
//                       ],
//                     )),
//                 expansitionTItle(
//                     image: "assets/images/Group 69802.png",
//                     text: "Notifications",
//                     column: Column(
//                       children: [
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location"),
//                         columnTitle(
//                             titleImage: "assets/images/Group 69796.png",
//                             titleText: "Location")
//                       ],
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget listMenu({String image, String text, Function onclick}) => Padding(
//         padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
//         child: InkWell(
//           onTap: () {
//             setState(() {
//               onclick();
//             });
//           },
//           child: Container(
//             height: 80,
//             decoration: BoxDecoration(
//               color: Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(50),
//                       image: DecorationImage(
//                         image: AssetImage(
//                           image,
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 2,
//                 ),
//                 Center(
//                   child: Text(
//                     text,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: EdgeInsets.only(right: 6),
//                   child: Center(
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.arrow_forward_ios,
//                         size: 20,
//                         color: Color(0xff747474),
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//   Widget close() => Padding(
//         padding: EdgeInsets.only(
//           top: 15,
//           right: 3,
//         ),
//         child: Container(
//           height: 45,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Center(
//                 child: IconButton(
//                     icon: Icon(
//                       Icons.close,
//                       size: 26,
//                     ),
//                     onPressed: () {}),
//               ),
//             ],
//           ),
//         ),
//       );
// //   Widget expansitionTItle({String text, String image, Widget column}) =>
// //       Container(
// //         child: ExpansionPanelList(
// //           title: Container(
// //             height: 80,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               color: Colors.grey.shade300,
// //               borderRadius: BorderRadius.circular(10),
// //             ),
// //             child: Column(
// //               children: [
// //                 Row(
// //                   children: [
// //                     Padding(
// //                       padding: EdgeInsets.all(15),
// //                       child: Container(
// //                         height: 50,
// //                         width: 50,
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(50),
// //                           image: DecorationImage(
// //                             image: AssetImage(
// //                               image,
// //                             ),
// //                             fit: BoxFit.fill,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       width: 2,
// //                     ),
// //                     Center(
// //                       child: Text(
// //                         text,
// //                         style: TextStyle(
// //                             fontWeight: FontWeight.bold, fontSize: 15),
// //                       ),
// //                     ),
// //                     Spacer(),
// //                     // Padding(
// //                     //   padding: EdgeInsets.only(right: 6),
// //                     //   child: Center(
// //                     //     child: IconButton(
// //                     //       icon: Icon(
// //                     //         Icons.arrow_forward_ios,
// //                     //         size: 20,
// //                     //         color: Color(0xff747474),
// //                     //       ),
// //                     //       onPressed: () {},
// //                     //     ),
// //                     //   ),
// //                     // ),
// //                   ],
// //                 ),
// //                 Expanded(
// //                   child: Container(
// //                     height: 4,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           ///////
// //           children: [
// //             column,
// //           ],
// //
// //           // collapsedBackgroundColor: Colors.grey.shade300,
// //           backgroundColor: Colors.white,
// //         ),
// //       );
// //
// //   Widget columnTitle({String titleImage, String titleText}) => Padding(
// //         padding: EdgeInsets.only(
// //           left: 70,
// //           top: 2,
// //           bottom: 2,
// //         ),
// //         child: Container(
// //           height: 30,
// //           child: Row(
// //             children: [
// //               Container(
// //                   height: 30,
// //                   width: 30,
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey,
// //                     borderRadius: BorderRadius.circular(30),
// //                     image: DecorationImage(
// //                       image: AssetImage(
// //                         titleImage,
// //                       ),
// //                       fit: BoxFit.cover,
// //                     ),
// //                   )),
// //               SizedBox(
// //                 width: 8,
// //               ),
// //               Text(
// //                 titleText,
// //                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
// //               )
// //             ],
// //           ),
// //         ),
// //       );
// // }
