import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mothakem/addDevice.dart';
import 'package:mothakem/backServices.dart';
import 'package:mothakem/newHomePage.dart';
// import 'package:url_launcher/url_launcher.dart';

class LivingRoom extends StatefulWidget {
  LivingRoom(
      {super.key,
      required this.FB_pin_9,
      required this.FB_pin_11,
      required this.FB_pin_22,
      required this.FB_pin_23,
      required this.FB_pin_25,
      required this.FB_pin_26,
      required this.FB_pin_27,
      required this.FB_pin_28,
      required this.passcode});
  String FB_pin_22,
      FB_pin_23,
      FB_pin_25,
      FB_pin_26,
      FB_pin_27,
      FB_pin_28,
      FB_pin_11,
      FB_pin_9,
      passcode;

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  bool switchValue3 = false;
  bool switchValue0 = false;
  bool switchValue1 = false;
  bool switchValue2 = false;
  static const IconData tv = IconData(0xe687, fontFamily: 'MaterialIcons');
  static const IconData light = IconData(0xe37c, fontFamily: 'MaterialIcons');
  Color light_card = Color(0xFFFFFFFF);
  Color light_img = Color(0xFF000000);
  Color light_text = Color(0xFF000000);
  Color ac_card = Color(0xFFFFFFFF);
  Color ac_data = Color(0xFF000000);
  Color tv_card = Color(0xFFFFFFFF);
  Color tv_data = Color(0xFF000000);
  Color fan_card = Color(0xFFFFFFFF);
  Color fan_data = Color(0xFF000000);
  List n = [];
  List n2 = [];
  bool b = false;
  late DatabaseReference FD;
  late DatabaseReference ref;
  late DatabaseReference ref2;
  late DatabaseReference ref3;
  late DatabaseReference ref4;
  late DatabaseReference ref5;
  late DatabaseReference ref6;
  late DatabaseReference ref7;
  late DatabaseReference ref8;
  late DatabaseReference ref9;
  late DatabaseReference ref10;
  late DatabaseReference ref11;
  List actions = [];
  // List actionsName = [];
  List refS = [];
  List newRefS = [];

  initialDatabaseReference() {
    FD = FirebaseDatabase.instance.ref("${widget.passcode}");
    ref = FirebaseDatabase.instance.ref("${widget.passcode}").child("0");
    ref2 = FirebaseDatabase.instance.ref("${widget.passcode}").child("1");
    ref3 = FirebaseDatabase.instance.ref("${widget.passcode}").child("2");
    ref4 = FirebaseDatabase.instance.ref("${widget.passcode}").child("3");
    ref5 = FirebaseDatabase.instance.ref("${widget.passcode}").child("4");
    ref6 = FirebaseDatabase.instance.ref("${widget.passcode}").child("5");
    ref7 = FirebaseDatabase.instance.ref("${widget.passcode}").child("6");
    ref8 = FirebaseDatabase.instance.ref("${widget.passcode}").child("7");
    ref9 = FirebaseDatabase.instance.ref("${widget.passcode}").child("8");
    ref10 = FirebaseDatabase.instance.ref("${widget.passcode}").child("9");
    ref11 = FirebaseDatabase.instance.ref("${widget.passcode}").child("10");

    //=====
    refS.add(ref);
    refS.add(ref2);
    refS.add(ref3);
    refS.add(ref4);
    refS.add(ref5);
    refS.add(ref6);
    refS.add(ref7);
    refS.add(ref8);
    refS.add(ref9);
    refS.add(ref10);
    refS.add(ref11);
    String f = '';
    FD.onValue.listen((event) {
      f = event.snapshot.value.toString();
      print("#####${f}");

      print("@@@@@@@F${f.contains("true")}");
    });
    ref.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    ref2.onValue.listen((event) async {
      actions.add(event.snapshot.value.toString());
    });
    ref3.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    ref4.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    ref5.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    ref6.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    ref7.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    ref8.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });

    ref9.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });

    ref10.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    ref11.onValue.listen((event) {
      actions.add(event.snapshot.value.toString());
    });
    actions.sort();

    setState(() {});
    // getData();

    getData2();
  }

  getData() async {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('devices')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    n2.addAll(response.docs);

    for (int i = 0; i < n2.length; i++) {
      if (n2[i]["name"] != "null" && n2[i]["pos"] == "Livingroom") {
        setState(() {
          newRefS.add(refS[i]);
          print("rrr newrefs ${newRefS}");
          // if (i == 0) {
          //   refS.add(ref);
          // } else if (i == 1) {
          //   refS.add(ref2);
          // } else if (i == 2) {
          //   refS.add(ref3);
          // } else if (i == 3) {
          //   refS.add(ref4);
          // } else if (i == 4) {
          //   refS.add(ref5);
          // } else if (i == 5) {
          //   refS.add(ref6);
          // }
        });
        n.add(n2[i]);
      }
    }

    // int j = 0;
    // for (int i = 0; i < refS.length; i++) {
    //   // print("BED num ${n[j]["numID"]}");
    //   if (n[j]["numID"] == i.toString()) {
    //     newRefS.add(refS);
    //     print("BED num ${n[j]["numID"]}");
    //     j++;
    //   }
    // }

    setState(() {
      print("Bed n ${n}");
      actions.sort();
      print("bed ac ${actions}");
      print("+++ ac0 ${actions}");
    });
  }

  getData2() {
    String f = '';
    FD.onValue.listen((event) {
      f = event.snapshot.value.toString();
      print("#####BED${f}");

      print("@@@@@@@FBED${f.contains("true")}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initialDatabaseReference();

    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    String cvc = '';
    return Scaffold(
      body: refS.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .02),
                  child: SafeArea(
                    child: Container(
                      child: StreamBuilder(
                          stream: FD.onValue,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              if (snapshot.data!.snapshot.value == null) {
                                return Scaffold(
                                    body: Container(
                                        child: Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, bottom: 25),
                                        child: Text(
                                          "Devices",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 18, left: 15),
                                        child: InkWell(
                                          child: Icon(
                                            Icons.add_box,
                                            size: 35,
                                          ),
                                          onTap: () {
                                            //   Navigator.pushAndRemoveUntil(
                                            //       context,
                                            //       MaterialPageRoute(
                                            //         builder: (context) => addDevice(),
                                            //       ),
                                            //       (route) => false);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 100),
                                    child: Text(
                                      "No devices",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ])));
                              } else {
                                Map<dynamic, dynamic> map =
                                    snapshot.data!.snapshot.value as dynamic;
                                List<dynamic> list2 = [];
                                List<dynamic> list3 = [];
                                List<dynamic> list = [];
                                list2.clear();
                                list2 = map.values.toList();
                                for (int i = 0; i < list2.length; i++) {
                                  if (list2[i]["action"] == false ||
                                      list2[i]["action"] == true) {
                                    list3.add(list2[i]);
                                  }
                                }
                                print("BED list3 ${list3}");

                                for (int i = 0; i < n2.length; i++) {
                                  print("BED name1 ${n2[i]['name']}");

                                  if (n2[i]['name'] != "null" &&
                                      n2[i]['pos'] == "Livingroom") {
                                    list.add(list3[i]);
                                    print("BED name2 ${n2[i]['name']}");
                                    print("BED list3 ${list3[i]}");
                                  }
                                }
                                cvc = list2[6]['temp'].toString();

                                print("BED list ${list}");
                                //#################################################

                                return Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, bottom: 25),
                                        child: Text(
                                          "Devices",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 18, left: 15),
                                        child: InkWell(
                                          child: Icon(
                                            Icons.add_box,
                                            size: 35,
                                          ),
                                          onTap: () {
                                            print("tapped");

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => addDevice(
                                                  FB_pin_25: widget.FB_pin_25,
                                                  FB_pin_23: widget.FB_pin_23,
                                                  FB_pin_26: widget.FB_pin_26,
                                                  FB_pin_27: widget.FB_pin_27,
                                                  FB_pin_28: widget.FB_pin_28,
                                                  FB_pin_11: widget.FB_pin_11,
                                                  FB_pin_22: widget.FB_pin_22,
                                                  FB_pin_9: widget.FB_pin_9,
                                                  passcode: widget.passcode,
                                                  pos: "Livingroom",
                                                ),
                                              ),
                                            );
                                            //====================================================
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 120),
                                        // color: Colors.blue,
                                        width: 80,
                                        height: 70,
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "$cvc°",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Icon(
                                                Icons.thermostat,
                                                size: 38,
                                                color: int.parse(cvc) > 28 &&
                                                        int.parse(cvc) <= 38
                                                    ? Colors.amber[900]
                                                    : int.parse(cvc) > 38
                                                        ? Colors.red
                                                        : Colors.blue,
                                              ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  n.length == 0
                                      ? Center(
                                          child: Text(
                                            "No devices",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 35),
                                          ),
                                        )
                                      : Container(
                                          width: 500,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .67,
                                          child: GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              itemCount: n.length,
                                              itemBuilder: (context, i) {
                                                print("BED i ${i}");
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .50,
                                                  height: 235,
                                                  child: Card(
                                                    color: bool.parse(
                                                              list[i].toString().substring(
                                                                  list[i]
                                                                          .toString()
                                                                          .indexOf(
                                                                              " ") +
                                                                      1,
                                                                  list[i]
                                                                      .toString()
                                                                      .indexOf(
                                                                          "}")),
                                                            ) ==
                                                            true
                                                        ? Colors.black
                                                        : Colors.white,
                                                    // margin: EdgeInsets.only(left: 15),
                                                    child: InkWell(
                                                      onLongPress: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  "You want to delete button"),
                                                              actions: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () async {
                                                                          print(
                                                                              "========delete");
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection(
                                                                                  'devices')
                                                                              .doc(n[i]
                                                                                  .id)
                                                                              .update({
                                                                            "name":
                                                                                "null"
                                                                          });

                                                                          Navigator.pushAndRemoveUntil(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => HomePage(FB_pin_23: widget.FB_pin_23, FB_pin_9: widget.FB_pin_9, FB_pin_11: widget.FB_pin_11, FB_pin_22: widget.FB_pin_22, FB_pin_25: widget.FB_pin_25, FB_pin_26: widget.FB_pin_26, FB_pin_27: widget.FB_pin_27, FB_pin_28: widget.FB_pin_28, passcode: widget.passcode),
                                                                              ),
                                                                              (route) => false);
                                                                        },
                                                                        child: Text(
                                                                            "delete")),
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: Text(
                                                                            "cancel")),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Switch(
                                                                  activeColor:
                                                                      Colors
                                                                          .grey
                                                                          .shade400,
                                                                  activeTrackColor:
                                                                      Colors
                                                                          .green,
                                                                  inactiveThumbColor: Colors
                                                                      .blueGrey
                                                                      .shade600,
                                                                  inactiveTrackColor:
                                                                      Colors
                                                                          .grey
                                                                          .shade400,
                                                                  splashRadius:
                                                                      50.0,
                                                                  value: bool
                                                                      .parse(
                                                                    list[i].toString().substring(
                                                                        list[i].toString().indexOf(" ") +
                                                                            1,
                                                                        list[i]
                                                                            .toString()
                                                                            .indexOf("}")),
                                                                  ),
                                                                  onChanged:
                                                                      (value) async {
                                                                    b = bool
                                                                        .parse(
                                                                      list[i].toString().substring(
                                                                          list[i].toString().indexOf(" ") +
                                                                              1,
                                                                          list[i]
                                                                              .toString()
                                                                              .indexOf("}")),
                                                                    );
                                                                    print(
                                                                        "++ b $b");
                                                                    await newRefS[
                                                                            i]
                                                                        .set({
                                                                      "action":
                                                                          value,
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      b = value;
                                                                      print(
                                                                          "---Switch ${actions}");
                                                                    });
                                                                  }),
                                                            ),
                                                            Icon(
                                                              n[i]['name']
                                                                          .toString()
                                                                          .toLowerCase()
                                                                          .contains(
                                                                              "ac") ||
                                                                      n[i]['name']
                                                                          .toString()
                                                                          .toLowerCase()
                                                                          .contains(
                                                                              "aircondition")
                                                                  ? Icons
                                                                      .ac_unit
                                                                  : n[i]['name']
                                                                              .toString()
                                                                              .toLowerCase()
                                                                              .contains(
                                                                                  "lamp") ||
                                                                          n[i]['name']
                                                                              .toString()
                                                                              .toLowerCase()
                                                                              .contains(
                                                                                  "led")
                                                                      ? Icons
                                                                          .light
                                                                      : n[i]['name']
                                                                              .toString()
                                                                              .toLowerCase()
                                                                              .contains("fan")
                                                                          ? Icons.air
                                                                          : n[i]['name'].toString().toLowerCase().contains("tv")
                                                                              ? Icons.tv
                                                                              : n[i]['name'].toString().toLowerCase().contains("Cattail") || n[i]['name'].toString().toLowerCase().contains("boiler") || n[i]['name'].toString().toLowerCase().contains("Kettel") || n[i]['name'].toString().toLowerCase().contains("tea") || n[i]['name'].toString().toLowerCase().contains("cafe")
                                                                                  ? Icons.local_cafe
                                                                                  : n[i]['name'].toString().toLowerCase().contains("shower") || n[i]['name'].toString().toLowerCase().contains("heater")
                                                                                      ? Icons.shower
                                                                                      : n[i]['name'].toString().toLowerCase().contains("charger") || n[i]['name'].toString().toLowerCase().contains("cable") || n[i]['name'].toString().toLowerCase().contains("plug")
                                                                                          ? Icons.electrical_services
                                                                                          : n[i]['name'].toString().toLowerCase().contains("phone")
                                                                                              ? Icons.phone_android
                                                                                              : Icons.real_estate_agent_outlined,
                                                              //devices_other
                                                              size: 90,
                                                              color: bool.parse(
                                                                        list[i].toString().substring(
                                                                            list[i].toString().indexOf(" ") +
                                                                                1,
                                                                            list[i].toString().indexOf("}")),
                                                                      ) ==
                                                                      false
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                                "${n[i]['name']}",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: bool
                                                                              .parse(
                                                                            list[i].toString().substring(list[i].toString().indexOf(" ") + 1,
                                                                                list[i].toString().indexOf("}")),
                                                                          ) ==
                                                                          false
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .white,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                ]);
                              }
                            }
                          }),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

//=================================================================================
// static const IconData tv = IconData(0xe687, fontFamily: 'MaterialIcons');
//   static const IconData light = IconData(0xe37c, fontFamily: 'MaterialIcons');
//   Color light_card = Color(0xFFFFFFFF);
//   Color light_img = Color(0xFF000000);
//   Color light_text = Color(0xFF000000);
//   Color ac_card = Color(0xFFFFFFFF);
//   Color ac_data = Color(0xFF000000);
//   Color tv_card = Color(0xFFFFFFFF);
//   Color tv_data = Color(0xFF000000);
//   Color fan_card = Color(0xFFFFFFFF);
//   Color fan_data = Color(0xFF000000);

//   late DatabaseReference FD;
//   late DatabaseReference ref;
//   late DatabaseReference ref2;
//   late DatabaseReference ref3;
//   late DatabaseReference ref4;
//   late DatabaseReference ref5;
//   late DatabaseReference ref6;

//   initialDatabaseReference() {
//     FD = FirebaseDatabase.instance.ref("${widget.passcode}");
//     ref = FirebaseDatabase.instance.ref("${widget.passcode}").child("0");
//     ref2 = FirebaseDatabase.instance.ref("${widget.passcode}").child("1");
//     ref3 = FirebaseDatabase.instance.ref("${widget.passcode}").child("2");
//     ref4 = FirebaseDatabase.instance.ref("${widget.passcode}").child("servo");
//     ref5 = FirebaseDatabase.instance.ref("${widget.passcode}").child("flame");
//     ref6 = FirebaseDatabase.instance.ref("${widget.passcode}").child("3");
//     getData2();
//   }

//   late bool switchValue0;
//   late bool switchValue1;
//   late bool switchValue2;
//   late bool switchValue3;
//   getData2() {
//     String f = '';
//     FD.onValue.listen((event) {
//       f = event.snapshot.value.toString();
//       print("#####${f}");

//       print("@@@@@@@F${f.contains("true")}");
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     initializeService();

//     initialDatabaseReference();
//     // getData2();
//   }

//   Widget build(BuildContext context) {
//     switchValue0 = widget.FB_pin_25.contains("true");
//     switchValue1 = widget.FB_pin_26.contains("true");
//     switchValue2 = widget.FB_pin_27.contains("true");
//     switchValue3 = widget.FB_pin_28.contains("true");
//     return Scaffold(
//       body: Container(
//           height: MediaQuery.of(context).size.height,
//           padding:
//               EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
//           child: SafeArea(
//             child: Container(
//               child: StreamBuilder(
//                   stream: FD.onValue,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return Center(child: CircularProgressIndicator());
//                     } else {
//                       if (snapshot.data!.snapshot.value == null) {
//                         return Scaffold(
//                             body: Container(
//                                 child: Column(children: [
//                           Row(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.only(left: 10, bottom: 25),
//                                 child: Text(
//                                   "Devices",
//                                   style: TextStyle(
//                                       fontSize: 35,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(bottom: 18, left: 15),
//                                 child: InkWell(
//                                   child: Icon(
//                                     Icons.add_box,
//                                     size: 35,
//                                   ),
//                                   onTap: () {
//                                     //   Navigator.pushAndRemoveUntil(
//                                     //       context,
//                                     //       MaterialPageRoute(
//                                     //         builder: (context) => addDevice(),
//                                     //       ),
//                                     //       (route) => false);
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(top: 100),
//                             child: Text(
//                               "No devices",
//                               style: TextStyle(
//                                   fontSize: 35, fontWeight: FontWeight.bold),
//                             ),
//                           )
//                         ])));
//                       } else {
//                         Map<dynamic, dynamic> map =
//                             snapshot.data!.snapshot.value as dynamic;
//                         List<dynamic> list = [];
//                         list.clear();
//                         list = map.values.toList();
// //==================================================================================
//                         // for (int i = 0; i < list.length;i++){
//                         //   //############## AC
//                         // if(list[i]==){
//                         print("!@#AC ${list[0]["action"]}");
//                         switchValue0 = list[0]["action"];
//                         if (list[0]["action"] == true) {
//                           print("-------asdf");
//                           ac_data = Color(0xFFFFFFFF);
//                           ac_card = Color(0xFF000000);
//                           widget.FB_pin_25 = "true";
//                           // sendData(value);
//                         } else {
//                           ac_data = Color(0xFF000000);
//                           ac_card = Color(0xFFFFFFFF);
//                           widget.FB_pin_25 = "false";
//                           // sendData(value);
//                         }
//                         // }
//                         //#################################################

//                         //############## LED
//                         print("!@#LED ${list[1]["action"]}");
//                         switchValue1 = list[1]["action"];
//                         if (switchValue1 == true) {
//                           light_img = Color(0xFFFFEB3B);
//                           light_card = Color(0xFF000000);
//                           light_text = Color(0xFFFFFFFF);
//                           widget.FB_pin_26 = "true";
//                         } else {
//                           light_img = Color(0xFF000000);
//                           light_text = Color(0xFF000000);
//                           light_card = Color(0xFFFFFFFF);
//                           widget.FB_pin_26 = "false";
//                         }
//                         //#################################################

//                         //############## Fan
//                         print("!@#Fan ${list[2]["action"]}");
//                         switchValue2 = list[2]["action"];
//                         if (list[2]["action"] == true) {
//                           fan_data = Color(0xFFFFFFFF);
//                           fan_card = Color(0xFF000000);
//                         } else {
//                           fan_data = Color(0xFF000000);
//                           fan_card = Color(0xFFFFFFFF);
//                         }
//                         //#################################################

//                         //############## TV
//                         print("!@#TV ${list[3]["action"]}");
//                         switchValue3 = list[3]["action"];
//                         if (list[3]["action"] == true) {
//                           tv_data = Color(0xFFFFFFFF);
//                           tv_card = Color(0xFF000000);
//                         } else {
//                           tv_data = Color(0xFF000000);
//                           tv_card = Color(0xFFFFFFFF);
//                         }
//                         // }
//                         //#################################################

//                         return Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   padding:
//                                       EdgeInsets.only(left: 10, bottom: 25),
//                                   child: Text(
//                                     "Devices",
//                                     style: TextStyle(
//                                         fontSize: 35,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(bottom: 18, left: 15),
//                                   child: InkWell(
//                                     child: Icon(
//                                       Icons.add_box,
//                                       size: 35,
//                                     ),
//                                     onTap: () async {
//                                       //======================================================
//                                       // print("tapped");
//                                       // Navigator.pushAndRemoveUntil(
//                                       //     context,
//                                       //     MaterialPageRoute(
//                                       //       builder: (context) => addDevice(
//                                       //         FB_pin_25: widget.FB_pin_25,
//                                       //         FB_pin_26: widget.FB_pin_26,
//                                       //         FB_pin_27: widget.FB_pin_27,
//                                       //         FB_pin_28: widget.FB_pin_28,
//                                       //         FB_pin_11: widget.FB_pin_11,
//                                       //         FB_pin_22: widget.FB_pin_22,
//                                       //         FB_pin_9: widget.FB_pin_9,
//                                       //         passcode: widget.passcode,
//                                       //       ),
//                                       //     ),
//                                       //     (route) => false);
//                                       // //====================================================
//                                     },
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Container(
//                               width: 500,
//                               height: MediaQuery.of(context).size.height * .67,
//                               child: GridView(
//                                 shrinkWrap: true,
//                                 gridDelegate:
//                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                 ),
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.only(left: 5),
//                                     width:
//                                         MediaQuery.of(context).size.width * .50,
//                                     height: 235,
//                                     // height: MediaQuery.of(context).size.height * 0.3,

//                                     child: Card(
//                                       color: switchValue0
//                                           ? ac_card = Color(0xFF000000)
//                                           : ac_card = Color(0xFFFFFFFF),
//                                       // margin: EdgeInsets.only(left: 15),
//                                       child: Container(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 child: Switch(
//                                                     activeColor:
//                                                         Colors.grey.shade400,
//                                                     activeTrackColor:
//                                                         Colors.green,
//                                                     inactiveThumbColor: Colors
//                                                         .blueGrey.shade600,
//                                                     inactiveTrackColor:
//                                                         Colors.grey.shade400,
//                                                     splashRadius: 50.0,
//                                                     value: switchValue0,
//                                                     onChanged: (value) async {
//                                                       setState(() {
//                                                         print(
//                                                             "************${widget.FB_pin_25}");
//                                                         switchValue0 = value;
//                                                         if (switchValue0 ==
//                                                             true) {
//                                                           print("-------asdf");
//                                                           ac_data =
//                                                               Color(0xFFFFFFFF);
//                                                           ac_card =
//                                                               Color(0xFF000000);
//                                                           widget.FB_pin_25 =
//                                                               "true";
//                                                           // sendData(value);
//                                                         } else {
//                                                           ac_data =
//                                                               Color(0xFF000000);
//                                                           ac_card =
//                                                               Color(0xFFFFFFFF);
//                                                           widget.FB_pin_25 =
//                                                               "false";
//                                                           // sendData(value);
//                                                         }

//                                                         // getData();
//                                                       });
//                                                       await ref.set({
//                                                         "action": value,
//                                                       });
//                                                     })),
//                                             Icon(
//                                               Icons.ac_unit,
//                                               size: 90,
//                                               color: switchValue0
//                                                   ? ac_data = Color(0xFFFFFFFF)
//                                                   : ac_data = Color(0xFF000000),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text("AC",
//                                                 style: TextStyle(
//                                                     fontSize: 25,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: switchValue0
//                                                         ? ac_data =
//                                                             Color(0xFFFFFFFF)
//                                                         : ac_data =
//                                                             Color(0xFF000000))),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),

//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * .50,
//                                     height: 235,
//                                     // height: MediaQuery.of(context).size.height * 0.3,
//                                     padding: EdgeInsets.only(right: 5),
//                                     child: Card(
//                                       color: switchValue1
//                                           ? light_card = Color(0xFF000000)
//                                           : light_card = Color(0xFFFFFFFF),
//                                       child: Container(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(
//                                               alignment: Alignment.centerRight,
//                                               child: Switch(
//                                                 activeColor:
//                                                     Colors.grey.shade400,
//                                                 activeTrackColor: Colors.green,
//                                                 inactiveThumbColor:
//                                                     Colors.blueGrey.shade600,
//                                                 inactiveTrackColor:
//                                                     Colors.grey.shade400,
//                                                 splashRadius: 50.0,
//                                                 value: switchValue1,
//                                                 onChanged: (value) async {
//                                                   switchValue1 = value;
//                                                   if (switchValue1 == true) {
//                                                     setState(() {
//                                                       light_img =
//                                                           Color(0xFFFFEB3B);
//                                                       light_card =
//                                                           Color(0xFF000000);
//                                                       light_text =
//                                                           Color(0xFFFFFFFF);
//                                                       widget.FB_pin_26 = "true";
//                                                     });
//                                                   } else {
//                                                     setState(() {
//                                                       light_img =
//                                                           Color(0xFF000000);
//                                                       light_text =
//                                                           Color(0xFF000000);
//                                                       light_card =
//                                                           Color(0xFFFFFFFF);
//                                                       widget.FB_pin_26 =
//                                                           "false";
//                                                     });
//                                                     // await ref2.set({
//                                                     //   "Led_action": "off",
//                                                     //   "id": FirebaseAuth
//                                                     //       .instance.currentUser!.uid,
//                                                     // });
//                                                   }
//                                                   await ref2.set({
//                                                     "action": value,
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             Icon(
//                                               light,
//                                               size: 90,
//                                               color: switchValue1
//                                                   ? light_img =
//                                                       Color(0xFFFFEB3B)
//                                                   : light_img =
//                                                       Color(0xFF000000),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text("Light",
//                                                 style: TextStyle(
//                                                     color: switchValue1
//                                                         ? light_text =
//                                                             Color(0xFFFFFFFF)
//                                                         : light_text =
//                                                             Color(0xFF000000),
//                                                     fontSize: 25,
//                                                     fontWeight:
//                                                         FontWeight.bold)),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   //   ],
//                                   // ),

//                                   //==================================================================================================

//                                   Container(
//                                     padding: EdgeInsets.only(left: 5),
//                                     width:
//                                         MediaQuery.of(context).size.width * .50,
//                                     height: 235,
//                                     // height: MediaQuery.of(context).size.height * 0.3,

//                                     child: Card(
//                                       color: switchValue2
//                                           ? fan_card = Color(0xFF000000)
//                                           : fan_card = Color(0xFFFFFFFF),
//                                       // margin: EdgeInsets.only(left: 15),
//                                       child: Container(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 child: Switch(
//                                                     activeColor:
//                                                         Colors.grey.shade400,
//                                                     activeTrackColor:
//                                                         Colors.green,
//                                                     inactiveThumbColor: Colors
//                                                         .blueGrey.shade600,
//                                                     inactiveTrackColor:
//                                                         Colors.grey.shade400,
//                                                     splashRadius: 50.0,
//                                                     value: switchValue2,
//                                                     onChanged: (value) async {
//                                                       setState(() {
//                                                         print(
//                                                             "************${widget.FB_pin_25}");
//                                                         switchValue2 = value;
//                                                         if (switchValue2 ==
//                                                             true) {
//                                                           print("-------asdf");
//                                                           fan_data =
//                                                               Color(0xFFFFFFFF);
//                                                           fan_card =
//                                                               Color(0xFF000000);
//                                                           widget.FB_pin_25 =
//                                                               "true";
//                                                           // sendData(value);
//                                                         } else {
//                                                           fan_data =
//                                                               Color(0xFF000000);
//                                                           fan_card =
//                                                               Color(0xFFFFFFFF);
//                                                           widget.FB_pin_25 =
//                                                               "false";
//                                                           // sendData(value);
//                                                         }

//                                                         // getData();
//                                                       });
//                                                       await ref3.set({
//                                                         "action": value,
//                                                       });
//                                                     })),
//                                             Icon(
//                                               Icons.air_outlined,
//                                               size: 90,
//                                               color: switchValue2
//                                                   ? fan_data = Color(0xFFFFFFFF)
//                                                   : fan_data =
//                                                       Color(0xFF000000),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text("Fan",
//                                                 style: TextStyle(
//                                                     fontSize: 25,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: switchValue2
//                                                         ? fan_data =
//                                                             Color(0xFFFFFFFF)
//                                                         : fan_data =
//                                                             Color(0xFF000000))),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   //-------------------------------------------------------------------------------------------

//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * .50,
//                                     height: 235,
//                                     // height: MediaQuery.of(context).size.height * 0.3,
//                                     padding: EdgeInsets.only(right: 5),
//                                     child: Card(
//                                       color: tv_card,
//                                       child: Container(
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(
//                                               alignment: Alignment.centerRight,
//                                               child: Switch(
//                                                 activeColor:
//                                                     Colors.grey.shade400,
//                                                 activeTrackColor: Colors.green,
//                                                 inactiveThumbColor:
//                                                     Colors.blueGrey.shade600,
//                                                 inactiveTrackColor:
//                                                     Colors.grey.shade400,
//                                                 splashRadius: 50.0,
//                                                 value: switchValue3,
//                                                 onChanged: (value) async {
//                                                   setState(() {
//                                                     switchValue3 = value;
//                                                     if (switchValue3 == true) {
//                                                       tv_data =
//                                                           Color(0xFFFFFFFF);
//                                                       tv_card =
//                                                           Color(0xFF000000);
//                                                     } else {
//                                                       tv_data =
//                                                           Color(0xFF000000);
//                                                       tv_card =
//                                                           Color(0xFFFFFFFF);
//                                                     }
//                                                   });

//                                                   await ref6.set({
//                                                     "action": value,
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             Icon(
//                                               tv,
//                                               size: 90,
//                                               color: tv_data,
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text("TV",
//                                                 style: TextStyle(
//                                                     color: tv_data,
//                                                     fontSize: 25,
//                                                     fontWeight:
//                                                         FontWeight.bold)),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   //   ],
//                                   // )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       }
//                     }
//                   }),
//             ),

//             //
//           )),
//     );
