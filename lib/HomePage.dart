// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:platform_convertor/Global.dart';
// import 'package:platform_convertor/calls_page.dart';
// import 'package:platform_convertor/chats_pages.dart';
// import 'package:platform_convertor/setting_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   int initialTabBarIndex = 0;
//   late TabController tabeController;
//
//   TextStyle titelStyle1 = const TextStyle(
//     fontSize: 14,
//     color: Colors.grey,
//   );
//
//   final ImagePicker _picker = ImagePicker();
//
//   int initialStapperindex = 0;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     tabeController = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Platform Convertor",
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//         bottom: TabBar(
//           controller: tabeController,
//           indicatorColor: Colors.white,
//           indicatorWeight: 5,
//           indicatorSize: TabBarIndicatorSize.tab,
//           tabs: const [
//             Tab(
//               text: "CHATS",
//             ),
//             Tab(
//               text: "CALLS",
//             ),
//             Tab(
//               text: "SETTINGS",
//             ),
//           ],
//         ),
//         actions: [
//           Switch(
//             inactiveThumbImage: const NetworkImage(
//                 "https://upload.wikimedia.org/wikipedia/commons/6/66/Android_robot.png"),
//             value: Global.isIOS,
//             onChanged: (val) {
//               setState(() {
//                 Global.isIOS = val;
//               });
//             },
//           ),
//         ],
//         elevation: 0,
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           showDialog(
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 content: Container(
//                   height: 600,
//                   width: 500,
//                   child: Stepper(
//                     physics: const BouncingScrollPhysics(),
//                     currentStep: initialStapperindex,
//                     onStepTapped: (index) {
//                       setState(() {
//                         initialStapperindex = index;
//                       });
//                     },
//                     onStepContinue: () {
//                       if (initialStapperindex != 2) {
//                         setState(() {
//                           initialStapperindex++;
//                         });
//                       }
//                     },
//                     onStepCancel: () {
//                       if (initialStapperindex != 0) {
//                         setState(() {
//                           initialStapperindex--;
//                         });
//                       }
//                     },
//                     steps: <Step>[
//                       Step(
//                         isActive: initialStapperindex >= 0,
//                         title: const Text(
//                           "PROFILE PHOTO",
//                         ),
//                         content: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "Add profile Photo",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.bottomRight,
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundImage: (Global.Image != null)
//                                           ? FileImage(Global.Image!)
//                                           : null,
//                                       minRadius: 60,
//                                       // backgroundColor: Colors.grey,
//                                       child: (Global.Image != null)
//                                           ? const Text("")
//                                           : const Text("ADD"),
//                                     ),
//                                     FloatingActionButton(
//                                       onPressed: () async {
//                                         final XFile? image =
//                                             await _picker.pickImage(
//                                                 source: ImageSource.camera);
//                                         // final  XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
//                                         setState(() {
//                                           Global.Image = File(image!.path);
//                                         });
//                                       },
//                                       mini: true,
//                                       child: const Icon(Icons.add),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Step(
//                         isActive: initialStapperindex >= 1,
//                         title: const Text("NAME"),
//                         content: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "Enter name",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: nameController,
//                               validator: (val) {
//                                 if (val!.isEmpty) {
//                                   return "Enter your Name first..";
//                                 }
//                                 return null;
//                               },
//                               onSaved: (val) {
//                                 setState(() {
//                                   Global.Name = val;
//                                 });
//                               },
//                               decoration: const InputDecoration(
//                                 hintText: "Enter Your Name",
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Step(
//                         isActive: initialStapperindex >= 2,
//                         title: const Text("DISCRIPTION"),
//                         content: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "Enter Description",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: descriptionController,
//                               validator: (val) {
//                                 if (val!.isEmpty) {
//                                   return "Enter your Description first..";
//                                 }
//                                 return null;
//                               },
//                               onSaved: (val) {
//                                 setState(() {
//                                   Global.Description = val;
//                                 });
//                               },
//                               decoration: const InputDecoration(
//                                 hintText: "description",
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             context: context,
//           );
//         },
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 4,
//               child: Container(
//                 color: Colors.blueGrey,
//                 width: double.infinity,
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     SizedBox(height: 55),
//                     CircleAvatar(radius: 50),
//                     SizedBox(height: 10),
//                     Text(
//                       "John Doe",
//                       style: TextStyle(fontSize: 17, color: Colors.white),
//                     ),
//                     Text(
//                       "+91 45786 12350",
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 12,
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: const [
//                     ListTile(
//                       leading: Icon(
//                         Icons.people,
//                         color: Colors.black,
//                       ),
//                       title: Text(
//                         "NEW GROUP",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(
//                         Icons.person,
//                         color: Colors.black,
//                       ),
//                       title: Text(
//                         "NEW Contact",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(
//                         Icons.phone,
//                         color: Colors.black,
//                       ),
//                       title: Text(
//                         "Calls",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(
//                         Icons.bookmark,
//                         color: Colors.black,
//                       ),
//                       title: Text(
//                         "Saved Messages",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     ListTile(
//                       leading: Icon(
//                         Icons.settings,
//                         color: Colors.black,
//                       ),
//                       title: Text(
//                         "Settings",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: tabeController,
//         children: const [
//           chats_page(),
//           calls_page(),
//           setting_page(),
//         ],
//       ),
//     );
//   }
// }
