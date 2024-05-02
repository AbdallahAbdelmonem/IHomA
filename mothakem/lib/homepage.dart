// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mothakem/notify.dart';
// import 'package:path/path.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mothakem/LivingRoom.dart';
// import 'package:mothakem/BedRoom.dart';
// import 'package:mothakem/startPage.dart';
// import 'package:http/http.dart' as http;
// import 'package:quickalert/models/quickalert_type.dart';
// import 'package:quickalert/widgets/quickalert_dialog.dart';

// class HomePage extends StatefulWidget {
//   HomePage(
//       {super.key,
//       required this.FB_pin_11,
//       required this.FB_pin_22,
//       required this.FB_pin_25,
//       required this.FB_pin_26,
//       required this.FB_pin_27});
//   String FB_pin_22, FB_pin_25, FB_pin_26, FB_pin_27, FB_pin_11;
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // String FB_pin_25 = "", FB_pin_26 = "", FB_pin_27 = "";
//   List<Widget> wig = [
//     LivingRoom(
//       pin_25: "",
//       pin_26: "",
//       pin_27: "",
//     ),
//     BedRoom()
//   ];
//   bool switchValue = false;
//   bool switchValue0 = false;
//   bool switchValue1 = false;
//   bool switchValue2 = false;
//   File? file;
//   String? url;
//   XFile? img;

//   List<QueryDocumentSnapshot> n = [];
//   List<QueryDocumentSnapshot> n2 = [];

//   TextEditingController newPassword = TextEditingController();
//   Color col2 = Colors.grey;
//   int c2 = 0;
//   bool obscureText2 = true;
//   getData() async {
//     QuerySnapshot response = await FirebaseFirestore.instance
//         .collection('name')
//         .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     n.addAll(response.docs);

//     QuerySnapshot response2 = await FirebaseFirestore.instance
//         .collection('led')
//         .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     n2.addAll(response2.docs);
//     setState(() {
//       print(n);
//       print(n2);
//     });
//   }

//   // //#########################################

//   DatabaseReference ref = FirebaseDatabase.instance.ref("37").child("ac");
//   DatabaseReference ref2 = FirebaseDatabase.instance.ref("37").child("led");
//   DatabaseReference ref3 = FirebaseDatabase.instance.ref("37").child("fan");
//   DatabaseReference ref4 = FirebaseDatabase.instance.ref("37").child("servo");
//   // getData2() {
//   //   ref.onValue.listen((event) {
//   //     FB_pin_25 = event.snapshot.value.toString();
//   //     print("#####${FB_pin_25}");

//   //     print("@@@@@@@${FB_pin_25.contains("true")}");
//   //   });

//   //   ref2.onValue.listen((event) {
//   //     FB_pin_26 = event.snapshot.value.toString();
//   //     print("#####${FB_pin_26}");

//   //     print("@@@@@@@${FB_pin_26.contains("true")}");
//   //   });
//   //   ref3.onValue.listen((event) {
//   //     FB_pin_27 = event.snapshot.value.toString();
//   //     print("#####${FB_pin_27}");

//   //     print("@@@@@@@${FB_pin_27.contains("true")}");
//   //   });
//   // }

// //########################################################################
//   // getToken() async {
//   //   String? mytoken = await FirebaseMessaging.instance.getToken();
//   //   print("+++++++++++++++ ${mytoken}");
//   // }

//   // sendMessage(title, message) async {
//   //   var headersList = {
//   //     'Accept': '*/*',
//   //     'Content-Type': 'application/json',
//   //     'Authorization':
//   //         'key=AAAAjU9SQN8:APA91bE9E7YSuZL7fDMNohAIOwzaHpw4r5wp5cbniNlsOVMB_0XcEH8Cy_wZZzTxFP9LFYmNfi6LCQ1oMhRwHl6dsR0QxLlN0U8_gId1XnGtB6COuZQZq-3GSSsyglxJEefBakOzmxCW'
//   //   };
//   //   var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

//   //   var body = {
//   //     "to":
//   //         "fJGF3EtzRueO7GRaTApYCl:APA91bHfUsBA-Kqk2FXsIz80MSpVS1mozpg24mMN9marP6-iiRce8TPiRlYPdux5_rvwgSLqn56OQJlr_MaDXj_zEwGWq376XWQS-hXtyr_kyeljElwSXndyhm_J24r1E0TO-bWDGuwH",
//   //     "notification": {"title": title, "body": message, "sound": "Tri-tone"}
//   //   };

//   //   var req = http.Request('POST', url);
//   //   req.headers.addAll(headersList);
//   //   req.body = json.encode(body);

//   //   var res = await req.send();
//   //   final resBody = await res.stream.bytesToString();

//   //   if (res.statusCode >= 200 && res.statusCode < 300) {
//   //     print(resBody);
//   //   } else {
//   //     print(res.reasonPhrase);
//   //   }
//   // }
//   late localnotification service2;
//   DatabaseReference ref5 = FirebaseDatabase.instance.ref("37").child("flame");
//   getData2() async {
//     // service2.initlize();
//     ref5.onValue.listen((event) {
//       widget.FB_pin_11 = event.snapshot.value.toString();
//       print("#####------------${widget.FB_pin_11}");

//       print("@@@@@@@---------${widget.FB_pin_11.contains("noDetection")}");
//     });
//     if (widget.FB_pin_11.contains("noDetection")) {
      
//       // print("==============--------------#######");
//       // await service2.showNotification(
//       //     id: 1,
//       //     title: "a",
//       //     body: "Sustained effort is what makes the real difference",
//       //     second: 10);
//     }
//   }
// //#########################################################################

//   @override
//   void initState() {
//     getData();
    
//     // getToken();
//     getData2();
//     service2 = localnotification();
//     service2.initlize();
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //   if (message.notification != null) {
//     //     print("======================================");
//     //     print(message.notification!.title);
//     //     print(message.notification!.body);
//     //     AwesomeDialog(
//     //             context: context,
//     //             title: message.notification!.title,
//     //             body: Text("${message.notification!.body}"),
//     //             dialogType: DialogType.warning)
//     //         .show();
//     //     print("======================================");
//     //   }
//     // });
//     // getData2();
//     // ScaffoldMessenger.of(context)
//     //     .showSnackBar(SnackBar(content: Text("${""}")));

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     int x = 1;
//     return n.length == 0
//         ? Center(child: CircularProgressIndicator())
//         : DefaultTabController(
//             length: 2,
//             child: MaterialApp(
//               debugShowCheckedModeBanner: false,
//               home: Scaffold(
//                 appBar: AppBar(
//                   actions: [
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.center,
//                     //   children: [

//                     Container(
//                       margin: EdgeInsets.only(left: 46),
//                       child: IconButton(
//                         onPressed: () async {
//                           if (x == 0) {
//                             await ref4.set({
//                               "servo_action": "on",
//                             });
//                             x = 1;
//                           } else {
//                             await ref4.set({
//                               "servo_action": "off",
//                             });
//                             x = 0;
//                           }
//                         },
//                         icon: Icon(Icons.door_front_door_rounded),
//                         iconSize: 45,
//                       ),
//                     ),
//                     Container(
//                       // margin: EdgeInsets.only(left: 15),
//                       child: IconButton(
//                         onPressed: () async {
//                           print("======================================");
                          
//                           service2.initlize();
//                           await service2.showNotification(
//                               id: 1,
//                               title: "adsad",
//                               body:
//                                   "Sustained effort is what makes the real difference",
//                               second: 10);
//                         },
//                         icon: Icon(Icons.garage_rounded),
//                         iconSize: 45,
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(right: 70),
//                       child: IconButton(
//                         onPressed: () {
//                           // showDataAlert();
//                           showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(
//                                         20.0,
//                                       ),
//                                     ),
//                                   ),
//                                   contentPadding: EdgeInsets.only(
//                                     top: 10.0,
//                                   ),
//                                   title: Text(
//                                     "Reset password for door",
//                                     style: TextStyle(fontSize: 22.0),
//                                   ),
//                                   content: Container(
//                                       height: 300,
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 vertical: 20),
//                                             child: TextField(
//                                               obscureText: obscureText2,
//                                               controller: newPassword,
//                                               decoration: InputDecoration(
//                                                 hintText: "Enter password",
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20)),
//                                               ),
//                                             ),
//                                             width: 250,
//                                           ),
//                                           ElevatedButton(
//                                               onPressed: () async {
//                                                 await ref.set({
//                                                   "door": "${newPassword.text}",
//                                                 });
//                                                 print(
//                                                     "----------------${newPassword.text}");
//                                                 newPassword.text = "";
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text(
//                                                 "Reset",
//                                                 style: TextStyle(fontSize: 18),
//                                               )),
//                                         ],
//                                       )),
//                                 );
//                               });
//                         },
//                         icon: Icon(Icons.lock_reset_outlined),
//                         iconSize: 45,
//                       ),
//                     ),
//                     //   ],
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: InkWell(
//                         onTap: () async {
//                           GoogleSignIn gs = GoogleSignIn();
//                           gs.disconnect();
//                           await FirebaseAuth.instance.signOut();
//                           Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => StartPage(),
//                               ),
//                               (route) => false);
//                         },
//                         child: Icon(Icons.logout),
//                       ),
//                     ),
//                   ],
//                   leading: InkWell(
//                     child: Container(
//                       margin: EdgeInsets.only(left: 5),

//                       // width: 250,
//                       // height: 250,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         // borderRadius: BorderRadius.circular(50),
//                         color: Colors.black,
//                       ),
//                       child: file != null
//                           ? CircleAvatar(
//                               radius: 50.0, backgroundImage: FileImage(file!))
//                           : Text(
//                               textAlign: TextAlign.center,
//                               "${n[0]["name"].substring(0, 1).toUpperCase()}",
//                               style:
//                                   TextStyle(fontSize: 25, color: Colors.white),
//                             ),
//                     ),
//                   ),
//                   iconTheme: IconThemeData(color: Colors.black),
//                   backgroundColor: Colors.white,
//                   bottom: TabBar(isScrollable: true, tabs: [
//                     Tab(
//                       child: Text(
//                         "Living Room",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     Tab(
//                       child: Text(
//                         "Bed Room",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 body: TabBarView(
//                   children: [
//                     Container(
//                         child: LivingRoom(
//                       pin_25: widget.FB_pin_25,
//                       pin_26: widget.FB_pin_26,
//                       pin_27: widget.FB_pin_27,
//                     )),
//                     Container(
//                       child: BedRoom(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );

//     // return Scaffold(
//     //     appBar: AppBar(
//     //       bottom: TabBar(
//     //           isScrollable: true,
//     //           indicatorColor: Colors.red,
//     //           indicatorWeight: 10,
//     //           tabs: [
//     //             Tab(
//     //               child: Text(""),
//     //             ),
//     //             Tab(
//     //               child: Text("LivingRoom"),
//     //             ),
//     //             Tab(
//     //               child: Text("BedRoom"),
//     //             ),
//     //           ]),
//     //     ),
//     //     body: TabBarView(
//     //       children: [
//     //       Container(
//     //         child: LivingRoom(),
//     //       ),
//     //       Container(
//     //         child: BedRoom(),
//     //       )
//     //     ]));
//   }
// }
