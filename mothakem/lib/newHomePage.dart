import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mothakem/BedRoom.dart';
import 'package:mothakem/LivingRoom.dart';
import 'package:mothakem/backServices.dart';
import 'package:mothakem/main.dart';
import 'package:mothakem/startPage.dart';

class HomePage extends StatefulWidget {
  HomePage(
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List n2 = [];
  TextEditingController newPassword = TextEditingController();
  Color col2 = Colors.grey;
  int c2 = 0;
  bool obscureText2 = true;
  getData() async {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('name')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    n.clear();
    n.addAll(response.docs);

    for (int i = 0; i < n.length; i++) {
      print("namenn ${n[i]['name']}");
    }
    setState(() {
      print(n);
    });
  }

  getDevices() async {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('devices')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    n2.addAll(response.docs);
    setState(() {
      print(n2);
    });
  }

  // //#########################################
  late DatabaseReference FD;
  late DatabaseReference ref;
  late DatabaseReference ref2;
  late DatabaseReference ref3;
  late DatabaseReference ref4;
  late DatabaseReference ref5;
  late DatabaseReference ref6;
  late DatabaseReference ref7;
  late DatabaseReference ref8;

  initialDatabaseReference() {
    FD = FirebaseDatabase.instance.ref("${widget.passcode}");
    ref = FirebaseDatabase.instance.ref("${widget.passcode}").child("0");
    ref2 = FirebaseDatabase.instance.ref("${widget.passcode}").child("1");
    ref3 = FirebaseDatabase.instance.ref("${widget.passcode}").child("2");
    ref4 = FirebaseDatabase.instance.ref("${widget.passcode}").child("front");
    ref8 = FirebaseDatabase.instance.ref("${widget.passcode}").child("garage");
    ref5 = FirebaseDatabase.instance.ref("${widget.passcode}").child("flame");
    ref6 = FirebaseDatabase.instance.ref("${widget.passcode}").child("3");
    ref7 = FirebaseDatabase.instance.ref("${widget.passcode}").child("gas");
    getData2();
  }

  getData2() async {
    // service2.initlize();
    ref5.onValue.listen((event) {
      widget.FB_pin_11 = event.snapshot.value.toString();
      print("#####------------${widget.FB_pin_11}");

      print("@@@@@@@---------${widget.FB_pin_11.contains("Detection")}");
    });
    if (widget.FB_pin_11.contains("Detection")) {
      // showNotification();
    }
    ref7.onValue.listen((event) {
      widget.FB_pin_9 = event.snapshot.value.toString();
      print("#####------------${widget.FB_pin_9}");

      print("@@@@@@@---------${widget.FB_pin_9.contains("Detection")}");
    });
    if (widget.FB_pin_9.contains("Detection")) {
      // showNotification();
    }
    String f = '';
    FD.onValue.listen((event) {
      f = event.snapshot.value.toString();

      print("#####${f}");

      print("@@@@@@@F${f.contains("true")}");
    });
  }

  showNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("IHomA", "IHomA",
            priority: Priority.max, importance: Importance.max);

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails details = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    await notificationsPlugin.show(0, "$title", "$body", details,
        payload: "notification-payload");
  }

  void checkNotification() async {
    NotificationAppLaunchDetails? details =
        await notificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;

        if (response != null) {
          String? payload = response.payload;
          print("****Payload $payload");
        }
      }
    }
  }
//#########################################################################

  @override
  void initState() {
    initializeService();

    initialDatabaseReference();
    getData();
    checkNotification();
    getDevices();
    // getData2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int x = 0, x2 = 0;
    String frontServo = "", backServo = '', frontPass = '';
    return n.length == 0
        ? Center(child: CircularProgressIndicator())
        : DefaultTabController(
            length: 2,
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: StreamBuilder(
                  stream: FD.onValue,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.data!.snapshot.value == null) {
                        //==========================================================
                        return DefaultTabController(
                            length: 2,
                            child: MaterialApp(
                                debugShowCheckedModeBanner: false,
                                home: Scaffold(
                                  appBar: AppBar(
                                    actions: [
                                      Container(
                                        margin: EdgeInsets.only(left: 46),
                                        child: IconButton(
                                          onPressed: () async {},
                                          icon: Icon(
                                              Icons.door_front_door_rounded),
                                          iconSize: 45,
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 15),
                                        child: IconButton(
                                          onPressed: () async {},
                                          icon: Icon(Icons.garage_rounded),
                                          iconSize: 45,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 70),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.lock_reset_outlined),
                                          iconSize: 45,
                                        ),
                                      ),
                                      //   ],
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: InkWell(
                                          onTap: () async {
                                            GoogleSignIn gs = GoogleSignIn();
                                            gs.disconnect();
                                            await FirebaseAuth.instance
                                                .signOut();
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      StartPage(),
                                                ),
                                                (route) => false);
                                          },
                                          child: Icon(Icons.logout),
                                        ),
                                      ),
                                    ],
                                    leading: InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5),

                                        // width: 250,
                                        // height: 250,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // borderRadius: BorderRadius.circular(50),
                                          color: Colors.black,
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "${n[n.length - 1]["name"].substring(0, 1).toUpperCase()}",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    iconTheme:
                                        IconThemeData(color: Colors.black),
                                    backgroundColor: Colors.white,
                                    bottom: TabBar(isScrollable: true, tabs: [
                                      Tab(
                                        child: Text(
                                          "Living Room",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          "Bed Room",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  body: TabBarView(
                                    children: [
                                      Container(
                                          child: LivingRoom(
                                        FB_pin_11: widget.FB_pin_11,
                                        FB_pin_22: widget.FB_pin_22,
                                        FB_pin_23: widget.FB_pin_23,
                                        FB_pin_9: widget.FB_pin_9,
                                        FB_pin_25: widget.FB_pin_25,
                                        FB_pin_26: widget.FB_pin_26,
                                        FB_pin_27: widget.FB_pin_27,
                                        FB_pin_28: widget.FB_pin_28,
                                        passcode: widget.passcode,
                                      )),
                                      Container(
                                        child: BedRoom(
                                          FB_pin_11: widget.FB_pin_11,
                                          FB_pin_22: widget.FB_pin_22,
                                          FB_pin_23: widget.FB_pin_23,
                                          FB_pin_9: widget.FB_pin_9,
                                          FB_pin_25: widget.FB_pin_25,
                                          FB_pin_26: widget.FB_pin_26,
                                          FB_pin_27: widget.FB_pin_27,
                                          FB_pin_28: widget.FB_pin_28,
                                          passcode: widget.passcode,
                                        ),
                                      ),
                                    ],
                                  ),
                                )));

                        //==========================================================
                      } else {
                        Map<dynamic, dynamic> map =
                            snapshot.data!.snapshot.value as dynamic;
                        List<dynamic> list = [];
                        List<dynamic> list2 = [];
                        list2.clear();
                        list2 = map.values.toList();
                        for (int i = 0; i < list2.length; i++) {
                          if (list2[i]["action"] != false &&
                              list2[i]["action"] != true) {
                            list.add(list2[i]);
                          }
                        }
                        print("new list $list");
                        //############## servo
                        print("!@#frontservoooo ${widget.FB_pin_22}");
                        print("!@#garageservoooo ${widget.FB_pin_23}");
                        print("!@#flame ${widget.FB_pin_11}");
                        print("!@#gas ${widget.FB_pin_9}");
                        if (list[3]["flame_detection"] == "Detection") {
                          showNotification("Warring!!!!",
                              "The flame sensor detects the presence of a fire");
                        }
                        if (list[2]["gas_detection"] == "Detection") {
                          showNotification("Warring!!!!",
                              "The gas sensor detects the presence of a gas");
                        }
                        frontServo = list[3]["action"];
                        frontPass = list[3]["resetPassword"];
                        backServo = list[1]["action"];
                      }

                      return Scaffold(
                        appBar: AppBar(
                          actions: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [

                            Container(
                              margin: EdgeInsets.only(left: 46),
                              child: IconButton(
                                color: frontServo == "on"
                                    ? Colors.green
                                    : Colors.black,
                                onPressed: () async {
                                  print("AAAAAAAAAAAAAAAAAAAAAAAAAAA");
                                  if (frontServo.contains("off")) {
                                    await ref4.set({
                                      "action": "on",
                                      "resetPassword": "${frontPass}",
                                    });
                                    print(
                                        "AAAAAAAAAAAAAAAAAAAAAAAAAAA ${frontServo}");
                                    x = 1;
                                  } else {
                                    await ref4.set({
                                      "action": "off",
                                      "resetPassword": "${frontPass}",
                                    });
                                    x = 0;
                                  }
                                },
                                icon: Icon(Icons.door_front_door_rounded),
                                iconSize: 45,
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(left: 15),
                              child: IconButton(
                                color: backServo == "on"
                                    ? Colors.green
                                    : Colors.black,
                                onPressed: () async {
                                  print("AAAAAAAAAAAAAAAAAAAAAAAAAAA");
                                  if (backServo.contains("off")) {
                                    await ref8.set({
                                      "action": "on",
                                    });
                                    print(
                                        "AAAAAAAAAAAAAAAAAAAAAAAAAAA ${backServo}");
                                    x2 = 1;
                                  } else {
                                    await ref8.set({
                                      "action": "off",
                                    });
                                    x2 = 0;
                                  }
                                },
                                icon: Icon(Icons.garage_rounded),
                                iconSize: 45,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 70),
                              child: IconButton(
                                onPressed: () {
                                  // showDataAlert();
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                20.0,
                                              ),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                            top: 10.0,
                                          ),
                                          title: Text(
                                            "Reset password for door",
                                            style: TextStyle(fontSize: 22.0),
                                          ),
                                          content: Container(
                                              height: 300,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: TextField(
                                                      obscureText: obscureText2,
                                                      controller: newPassword,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "Enter password",
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                    ),
                                                    width: 250,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () async {
                                                        await ref4.set({
                                                          "action": frontServo,
                                                          "resetPassword":
                                                              "${newPassword.text}",
                                                        });
                                                        print(
                                                            "----------------${newPassword.text}");
                                                        newPassword.text = "";
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Reset",
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      )),
                                                ],
                                              )),
                                        );
                                      });
                                },
                                icon: Icon(Icons.lock_reset_outlined),
                                iconSize: 45,
                              ),
                            ),
                            //   ],
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () async {
                                  GoogleSignIn gs = GoogleSignIn();
                                  gs.disconnect();
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StartPage(),
                                      ),
                                      (route) => false);
                                },
                                child: Icon(Icons.logout),
                              ),
                            ),
                          ],
                          leading: InkWell(
                            child: Container(
                              margin: EdgeInsets.only(left: 5),

                              // width: 250,
                              // height: 250,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(50),
                                color: Colors.black,
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "${n[0]["name"].substring(0, 1).toUpperCase()}",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          iconTheme: IconThemeData(color: Colors.black),
                          backgroundColor: Colors.white,
                          bottom: TabBar(isScrollable: true, tabs: [
                            Tab(
                              child: Text(
                                "Living Room",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Bed Room",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                        body: TabBarView(
                          children: [
                            Container(
                                child: LivingRoom(
                              FB_pin_11: widget.FB_pin_11,
                              FB_pin_22: widget.FB_pin_22,
                              FB_pin_9: widget.FB_pin_9,
                              FB_pin_23: widget.FB_pin_23,
                              FB_pin_25: widget.FB_pin_25,
                              FB_pin_26: widget.FB_pin_26,
                              FB_pin_27: widget.FB_pin_27,
                              FB_pin_28: widget.FB_pin_28,
                              passcode: widget.passcode,
                            )),
                            Container(
                              child: BedRoom(
                                FB_pin_11: widget.FB_pin_11,
                                FB_pin_22: widget.FB_pin_22,
                                FB_pin_23: widget.FB_pin_23,
                                FB_pin_9: widget.FB_pin_9,
                                FB_pin_25: widget.FB_pin_25,
                                FB_pin_26: widget.FB_pin_26,
                                FB_pin_27: widget.FB_pin_27,
                                FB_pin_28: widget.FB_pin_28,
                                passcode: widget.passcode,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                )),
          );

    // return Scaffold(
    //     appBar: AppBar(
    //       bottom: TabBar(
    //           isScrollable: true,
    //           indicatorColor: Colors.red,
    //           indicatorWeight: 10,
    //           tabs: [
    //             Tab(
    //               child: Text(""),
    //             ),
    //             Tab(
    //               child: Text("LivingRoom"),
    //             ),
    //             Tab(
    //               child: Text("BedRoom"),
    //             ),
    //           ]),
    //     ),
    //     body: TabBarView(
    //       children: [
    //       Container(
    //         child: LivingRoom(),
    //       ),
    //       Container(
    //         child: BedRoom(),
    //       )
    //     ]));
  }
}
