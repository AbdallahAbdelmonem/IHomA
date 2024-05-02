import 'package:auto_start_flutter/auto_start_flutter.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mothakem/backServices.dart';
import 'package:mothakem/splashScreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();
initAutoStart() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('autoStart') == false) {
    getAutoStartPermission();
    await prefs.setBool('autoStart', true);
  }
  print("------prefs ${prefs.getBool('autoStart')}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC6e2MO4yMOgjp1pKyMzmtZtDeYymqVyMg",
        appId: "1:606921179359:android:f53051ae484b1babc5a96a",
        messagingSenderId: "606921179359",
        projectId: "mothakem-8a457"),
  );
  await FirebaseAppCheck.instance.activate();
  await initializeService();

  await Permission.notification.isDenied.then((value) async {
    if (value) {
      Permission.notification.request();

      AndroidInitializationSettings androidInitializationSettings =
          AndroidInitializationSettings("@mipmap/ic_launcher");

      DarwinInitializationSettings ios = DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestCriticalPermission: true,
          requestSoundPermission: true);

      InitializationSettings ins = InitializationSettings(
          android: androidInitializationSettings, iOS: ios);

      bool? initial = await notificationsPlugin.initialize(ins);
      print("----------notify ${initial}");
    }
  });
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('autoStart') != true) {
    await prefs.setBool('autoStart', false);

    print("------prefsss ${isAutoStartAvailable}");
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    initAutoStart();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
