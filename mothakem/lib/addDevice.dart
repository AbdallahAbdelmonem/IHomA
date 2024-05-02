import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mothakem/BedRoom.dart';
import 'package:mothakem/LivingRoom.dart';
import 'package:mothakem/newHomePage.dart';

class addDevice extends StatefulWidget {
  addDevice(
      {super.key,
      required this.FB_pin_9,
      required this.FB_pin_11,
      required this.FB_pin_22,
      required this.FB_pin_23,
      required this.FB_pin_25,
      required this.FB_pin_26,
      required this.FB_pin_27,
      required this.FB_pin_28,
      required this.passcode,
      required this.pos});
  String FB_pin_22,
      FB_pin_23,
      FB_pin_25,
      FB_pin_26,
      FB_pin_27,
      FB_pin_28,
      FB_pin_11,
      FB_pin_9,
      passcode,
      pos;
  @override
  State<addDevice> createState() => _addDeviceState();
}

class _addDeviceState extends State<addDevice> {
  @override
  late DatabaseReference FD;
  late DatabaseReference ref;
  late DatabaseReference ref2;
  late DatabaseReference ref3;
  late DatabaseReference ref4;
  late DatabaseReference ref5;
  late DatabaseReference ref6;
  late DatabaseReference ref7;
  late DatabaseReference ref8;
  late String num;
  late DatabaseReference refNum;
  initialDatabaseReference() {
    FD = FirebaseDatabase.instance.ref("${widget.passcode}");
    ref = FirebaseDatabase.instance.ref("${widget.passcode}").child("0");
    ref2 = FirebaseDatabase.instance.ref("${widget.passcode}").child("1");
    ref3 = FirebaseDatabase.instance.ref("${widget.passcode}").child("2");
    ref4 =
        FirebaseDatabase.instance.ref("${widget.passcode}").child("front");
    ref8 =
        FirebaseDatabase.instance.ref("${widget.passcode}").child("garage");
    ref5 = FirebaseDatabase.instance.ref("${widget.passcode}").child("flame");
    ref6 = FirebaseDatabase.instance.ref("${widget.passcode}").child("3");
    ref7 = FirebaseDatabase.instance.ref("${widget.passcode}").child("gas");
    refNum = FirebaseDatabase.instance.ref("${widget.passcode}").child("num");
    getData2();
  }

  String v2 = '';
  int v = -1;
  List n2 = [];
  getData() async {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('devices')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    n2.addAll(response.docs);

    for (int i = 0; i < n2.length; i++) {
      if (n2[i]["name"] == "null") {
        // n.add(n2[i]);
        v = i;
        v2 = n2[i]["numID"];
        break;
      }
    }
    setState(() {
      print("+++ list ${n2[0]}");
    });
  }

  getData2() async {
    // service2.initlize();

    String s = "}";
    String f = '';
    FD.onValue.listen((event) {
      f = event.snapshot.value.toString();
      print("#####${f}");

      print("@@@@@@@F${f.contains("true")}");
    });

    refNum.onValue.listen((event) {
      num = event.snapshot.value.toString();
      print(
          "#####------------${num.substring(num.indexOf(" ") + 1, num.indexOf("${s}"))}");
    });
  }

  @override
  void initState() {
    initialDatabaseReference();
    getData();
    super.initState();
  }

  TextEditingController name = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Add new device",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 28, bottom: 28),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Enter device name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              width: 360,
            ),
            ElevatedButton(
                onPressed: () async {
                  String s = "}";
                  int x;
                  print("+++ v $v");
                  if (v != -1) {
                    var device = FirebaseFirestore.instance
                        .collection('devices')
                        .doc("${v2}");
                    print("((((((((((devices is clicked))))))))))");
                    await device.set({
                      "name": name.text,
                      "numID": v2,
                      "pos": widget.pos,
                      "id": FirebaseAuth.instance.currentUser!.uid
                    }).then((value) {
                      initialDatabaseReference();
                      print("------------------------passcode Added");
                    }).catchError((error) => print(
                        "==================Failed to add passcode: $error"));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            FB_pin_11: widget.FB_pin_11,
                            FB_pin_22: widget.FB_pin_22,
                            FB_pin_23: widget.FB_pin_23,
                            FB_pin_25: widget.FB_pin_25,
                            FB_pin_26: widget.FB_pin_26,
                            FB_pin_27: widget.FB_pin_27,
                            FB_pin_28: widget.FB_pin_28,
                            FB_pin_9: widget.FB_pin_9,
                            passcode: widget.passcode,
                          ),
                        ),
                        (route) => false);
                  } else {
                    refNum = FirebaseDatabase.instance
                        .ref("${widget.passcode}")
                        .child("num");
                    refNum.onValue.listen((event) {
                      // num = int.fromEnvironment(event.snapshot.value.toString());
                      print("#####------------nnnn${num}");
                    });

                    var device = FirebaseFirestore.instance
                        .collection('devices')
                        .doc(
                            "${num.substring(num.indexOf(" ") + 1, num.indexOf("${s}"))}");
                    print("((((((((((devices is clicked))))))))))");
                    await device.set({
                      "name": name.text,
                      "numID": num.substring(
                          num.indexOf(" ") + 1, num.indexOf("${s}")),
                      "pos": widget.pos,
                      "id": FirebaseAuth.instance.currentUser!.uid
                    }).then((value) {
                      initialDatabaseReference();
                      print("------------------------passcode Added");
                    }).catchError((error) => print(
                        "==================Failed to add passcode: $error"));
                    x = int.parse(
                        "${num.substring(num.indexOf(" ") + 1, num.indexOf("${s}"))}");
                    x = x + 1;
                    print("#####------------ xxx ${x}");
                    await refNum.set({
                      "numDevice": x.toString(),
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            FB_pin_11: widget.FB_pin_11,
                            FB_pin_22: widget.FB_pin_22,
                            FB_pin_23: widget.FB_pin_23,
                            FB_pin_25: widget.FB_pin_25,
                            FB_pin_26: widget.FB_pin_26,
                            FB_pin_27: widget.FB_pin_27,
                            FB_pin_28: widget.FB_pin_28,
                            FB_pin_9: widget.FB_pin_9,
                            passcode: widget.passcode,
                          ),
                        ),
                        (route) => false);
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      )),
    );
  }
}


//
// late DatabaseReference FD;
//   late DatabaseReference ref;
//   late DatabaseReference ref2;
//   late DatabaseReference ref3;
//   late DatabaseReference ref4;
//   late DatabaseReference ref5;
//   late DatabaseReference ref6;
//   late DatabaseReference ref7;
//   late String num;
//   // late DatabaseReference refNum;
//   initialDatabaseReference() {
//     FD = FirebaseDatabase.instance.ref("${widget.passcode}");
//     ref = FirebaseDatabase.instance.ref("${widget.passcode}").child("AC");
//     ref2 = FirebaseDatabase.instance.ref("${widget.passcode}").child("led");
//     ref3 = FirebaseDatabase.instance.ref("${widget.passcode}").child("fan");
//     ref4 = FirebaseDatabase.instance.ref("${widget.passcode}").child("servo");
//     ref5 = FirebaseDatabase.instance.ref("${widget.passcode}").child("flame");
//     ref6 = FirebaseDatabase.instance.ref("${widget.passcode}").child("tv");
//     ref7 = FirebaseDatabase.instance.ref("${widget.passcode}").child("gas");
//     // refNum = FirebaseDatabase.instance.ref("${widget.passcode}").child("num");
//     getData2();
//   }

//   String v2 = '';
//   int v = -1;
//   List n2 = [];
//   List numDevices = [];
//   List numDevicesAll = [];
//   getData() async {
//     QuerySnapshot response = await FirebaseFirestore.instance
//         .collection('devices')
//         .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     n2.addAll(response.docs);
//     QuerySnapshot response2 = await FirebaseFirestore.instance
//         .collection('numDevices')
//         .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     numDevices.addAll(response2.docs);

//     QuerySnapshot response3 =
//         await FirebaseFirestore.instance.collection('numDevices').get();
//     numDevicesAll.addAll(response3.docs);
//     for (int i = 0; i < numDevicesAll.length; i++) {
//       print("numAll ${numDevicesAll[i]['numID']}");
//     }
//     for (int i = 0; i < n2.length; i++) {
//       if (n2[i]["name"] == "null") {
//         // n.add(n2[i]);
//         v = i;
//         v2 = n2[i]["numID"];
//         break;
//       }
//     }
//     setState(() {
//       print("+++ list ${n2[0]}");
//     });
//   }

//   getData2() async {
//     // service2.initlize();

//     String s = "}";
//     String f = '';
//     FD.onValue.listen((event) {
//       f = event.snapshot.value.toString();
//       print("#####${f}");

//       print("@@@@@@@F${f.contains("true")}");
//     });

//     // refNum.onValue.listen((event) {
//     //   num = event.snapshot.value.toString();
//     //   print(
//     //       "#####------------${num.substring(num.indexOf(" ") + 1, num.indexOf("${s}"))}");
//     // });
//   }

//   @override
//   void initState() {
//     initialDatabaseReference();
//     getData();
//     super.initState();
//   }

//   TextEditingController name = TextEditingController();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           "Add new device",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: 28, bottom: 28),
//               child: TextField(
//                 controller: name,
//                 decoration: InputDecoration(
//                   hintText: "Enter device name",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ),
//               width: 360,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   String s = "}";
//                   int x;
//                   print("+++ v $v");
//                   if (v != -1) {
//                     var device = FirebaseFirestore.instance
//                         .collection('devices')
//                         .doc("${v2}");
//                     var numDevices =
//                         FirebaseFirestore.instance.collection('numDevices');
//                     print("((((((((((devices is clicked))))))))))");
//                     await device.set({
//                       "name": name.text,
//                       "numID": v2,
//                       "pos": widget.pos,
//                       "id": FirebaseAuth.instance.currentUser!.uid
//                     }).then((value) {
//                       initialDatabaseReference();
//                       print("------------------------passcode Added");
//                     }).catchError((error) => print(
//                         "==================Failed to add passcode: $error"));
//                     Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomePage(
//                             FB_pin_11: widget.FB_pin_11,
//                             FB_pin_22: widget.FB_pin_22,
//                             FB_pin_25: widget.FB_pin_25,
//                             FB_pin_26: widget.FB_pin_26,
//                             FB_pin_27: widget.FB_pin_27,
//                             FB_pin_28: widget.FB_pin_28,
//                             FB_pin_9: widget.FB_pin_9,
//                             passcode: widget.passcode,
//                           ),
//                         ),
//                         (route) => false);
//                   } else {
//                     // refNum = FirebaseDatabase.instance
//                     //     .ref("${widget.passcode}")
//                     //     .child("num");
//                     // refNum.onValue.listen((event) {
//                     //   // num = int.fromEnvironment(event.snapshot.value.toString());
//                     //   print("#####------------nnnn${num}");
//                     // });

//                     var numDevice = FirebaseFirestore.instance
//                         .collection('numDevices')
//                         .doc("${FirebaseAuth.instance.currentUser!.uid}");
//                     var numDeviceAll =
//                         FirebaseFirestore.instance.collection('numDevices');

//                     if (numDevices.isEmpty) {
//                       numDevice.set({
//                         "numID": "0",
//                         "id": FirebaseAuth.instance.currentUser!.uid
//                       }).then((value) {
//                         numDevices.add({"numID": "0"});
//                         print("------------------------passcode Added");
//                       }).catchError((error) => print(
//                           "==================Failed to add passcode: $error"));
//                       print("nnnn ${numDevices}");
//                     }

//                     var device = FirebaseFirestore.instance
//                         .collection('devices')
//                         .doc("${numDevices[numDevices.length - 1]["numID"]}");

//                     print("((((((((((devices is clicked))))))))))");
//                     await device.set({
//                       "name": name.text,
//                       "numID": numDevices[numDevices.length - 1]["numID"],
//                       "pos": widget.pos,
//                       "id": FirebaseAuth.instance.currentUser!.uid
//                     }).then((value) {
//                       initialDatabaseReference();
//                       print("------------------------passcode Added");
//                     }).catchError((error) => print(
//                         "==================Failed to add passcode: $error"));

//                     numDevice.set({
//                       "numID":
//                           "${int.parse(numDevices[numDevices.length - 1]["numID"]) + 1}",
//                       "id": FirebaseAuth.instance.currentUser!.uid
//                     }).then((value) {
//                       // initialDatabaseReference();
//                       print("------------------------passcode Added");
//                     }).catchError((error) => print(
//                         "==================Failed to add passcode: $error"));
//                     print("nnnn ${numDevices}");

//                     // x = int.parse(
//                     //     "${num.substring(num.indexOf(" ") + 1, num.indexOf("${s}"))}");
//                     // x = x + 1;
//                     // print("#####------------ xxx ${x}");
//                     // await refNum.set({
//                     //   "numDevice": x.toString(),
//                     // });
//                     Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomePage(
//                             FB_pin_11: widget.FB_pin_11,
//                             FB_pin_22: widget.FB_pin_22,
//                             FB_pin_25: widget.FB_pin_25,
//                             FB_pin_26: widget.FB_pin_26,
//                             FB_pin_27: widget.FB_pin_27,
//                             FB_pin_28: widget.FB_pin_28,
//                             FB_pin_9: widget.FB_pin_9,
//                             passcode: widget.passcode,
//                           ),
//                         ),
//                         (route) => false);
//                   }
//                 },
//                 child: Text(
//                   "Add",
//                   style: TextStyle(fontSize: 18),
//                 ))
//           ],
//         ),
//       )),
//     );
//   }
// }

//