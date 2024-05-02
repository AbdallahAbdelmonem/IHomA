import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mothakem/main.dart';

// //#########################################

late DatabaseReference ref5;
late DatabaseReference ref7;
int x = 0;
var r;
List n = [];

initialDatabaseReference() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC6e2MO4yMOgjp1pKyMzmtZtDeYymqVyMg",
        appId: "1:606921179359:android:f53051ae484b1babc5a96a",
        messagingSenderId: "606921179359",
        projectId: "mothakem-8a457"),
  );
  await FirebaseAppCheck.instance.activate();

//==============================================================================
  if (FirebaseAuth.instance.currentUser != null) {
    // await initializeService();
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('passcode')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    n.addAll(response.docs);
    print("--n ${n[0]['passcode']}");
  }
  //========================================================================

  ref5 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("flame");
  ref7 = FirebaseDatabase.instance.ref("${n[0]["passcode"]}").child("gas");
// ref5 = FirebaseDatabase.instance.ref("37").child("flame");
//   ref7 = FirebaseDatabase.instance.ref("37").child("gas");
  ref5.onValue.listen((event) {
    if (!event.snapshot.value.toString().contains("noDetection")) {
      showNotification(
          "Warning!!!!!!!!", "The flame sensor detects the presence of a fire");
    }
    r = event.snapshot.value.toString();

    print("#####------------back${event.snapshot.value.toString()}");

    print(
        "@@@@@@@---------back${event.snapshot.value.toString().contains("noDetection")}");
  });
  ref7.onValue.listen((event) {
    if (!event.snapshot.value.toString().contains("noDetection")) {
      showNotification(
          "Warning!!!!!!!!", "The gas sensor detects the presence of a gas");
    }
    print("#####------------back${event.snapshot.value.toString()}");

    print(
        "@@@@@@@---------back${event.snapshot.value.toString().contains("noDetection")}");
  });
}

showNotification(String title, String body) async {
  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails("IHomA", "IHomA",
          priority: Priority.max,
          importance: Importance.max,
          sound: RawResourceAndroidNotificationSound("warning"));

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
  await notificationsPlugin.show(0, "$title", "$body", details);
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
      iosConfiguration: IosConfiguration(
          autoStart: true,
          onForeground: onStart,
          onBackground: onIosBackground),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart, isForegroundMode: true, autoStart: true));
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
      // initialDatabaseReference();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
      // initialDatabaseReference();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      // initialDatabaseReference();

      if (await service.isForegroundService()) {
        service.setForegroundNotificationInfo(
          title: "IHomA App",
          // content: "${r} sas",
          content: "is running...",
        );
      }
    }
    await initialDatabaseReference();
    // getData2();

    // print("background running");
    service.invoke('update');
  });
  // initialDatabaseReference();
}
