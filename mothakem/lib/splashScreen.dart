import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mothakem/backServices.dart';
import 'package:mothakem/newHomePage.dart';
import 'package:mothakem/startPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //#########################################
  String FB_pin_22 = "",
   FB_pin_23 = "",
      FB_pin_25 = "",
      FB_pin_26 = "",
      FB_pin_27 = "",
      FB_pin_28 = "",
      FB_pin_11 = '',
      FB_pin_9 = '';

  late DatabaseReference ref;
  late DatabaseReference ref2;
  late DatabaseReference ref3;
  late DatabaseReference ref4;
  late DatabaseReference ref5;
  late DatabaseReference ref6;
  late DatabaseReference ref7;
  late DatabaseReference ref8;

  String flame = '';
  List n = [];
  // localnotification service2 = localnotification();
  getData() async {
    // QuerySnapshot response = await FirebaseFirestore.instance
    //     .collection('passcode')
    //     .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    //     .get();
    // n.addAll(response.docs);

    // // for (int i = 0; i < n.length; i++) {
    // print("List ${n[0]["passcode"]}");
    // }
    ref = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("0");
    ref2 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("1");
    ref3 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("2");
    ref4 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("front");
    ref8 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("garage");
    ref5 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("flame");
    ref6 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("3");
    ref7 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("gas");
    getData2();
  }

  getData2() {
    ref.onValue.listen((event) {
      FB_pin_25 = event.snapshot.value.toString();
      print("#####${FB_pin_25}");

      print("@@@@@@@${FB_pin_25.contains("true")}");
    });

    ref2.onValue.listen((event) {
      FB_pin_26 = event.snapshot.value.toString();
      print("#####${FB_pin_26}");

      print("@@@@@@@${FB_pin_26.contains("true")}");
    });
    ref3.onValue.listen((event) {
      FB_pin_27 = event.snapshot.value.toString();
      print("#####${FB_pin_27}");

      print("@@@@@@@${FB_pin_27.contains("true")}");
    });

    ref4.onValue.listen((event) {
      FB_pin_22 = event.snapshot.value.toString();
      print("#####splash${FB_pin_22}");

      print("@@@@@@@splash${FB_pin_22.contains("on")}");
    });

    ref8.onValue.listen((event) {
      FB_pin_23 = event.snapshot.value.toString();
      print("#####splash${FB_pin_23}");

      print("@@@@@@@splash${FB_pin_23.contains("on")}");
    });

    ref5.onValue.listen((event) async {
      FB_pin_11 = event.snapshot.value.toString();
      print("#####splash${FB_pin_11}");

      if (FB_pin_11.contains("Detection")) {}
      print("@@@@@@@splash${FB_pin_11.contains("Detection")}");
    });

    ref6.onValue.listen((event) {
      FB_pin_28 = event.snapshot.value.toString();
      print("#####splash${FB_pin_28}");

      print("@@@@@@@splash${FB_pin_28.contains("on")}");
    });

    ref7.onValue.listen((event) {
      FB_pin_9 = event.snapshot.value.toString();
      print("#####splash${FB_pin_9}");

      print("@@@@@@@splashgas${FB_pin_9.contains("Detection")}");
    });
  }

//#########################################################################

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () async {
      //8
      // await initializeService();
      if (FirebaseAuth.instance.currentUser != null) {
        // await initializeService();
        QuerySnapshot response = await FirebaseFirestore.instance
            .collection('passcode')
            .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();
        n.addAll(response.docs);
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => FirebaseAuth.instance.currentUser == null
              ? StartPage()
              : HomePage(
                  FB_pin_9: FB_pin_9,
                  FB_pin_11: FB_pin_11,
                  FB_pin_22: FB_pin_22,
                  FB_pin_25: FB_pin_25,
                  FB_pin_26: FB_pin_26,
                  FB_pin_27: FB_pin_27,
                  FB_pin_28: FB_pin_28,
                  FB_pin_23: FB_pin_23,
                  passcode: n[0]["passcode"],
                ),
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/Picture2.gif",
          ),
          Text(
            "IHomA",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
