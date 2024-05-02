// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mothakem/login.dart';
import 'package:mothakem/newHomePage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conPass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController passcode = TextEditingController();
  String message = "";
  Color col = Colors.grey, col2 = Colors.grey;
  int c = 0, c2 = 0;
  bool obscureText = true, obscureText2 = true;
  CollectionReference userName = FirebaseFirestore.instance.collection('name');

  // late DatabaseReference ref;
  // // late DatabaseReference ref2;
  // DatabaseReference ref3 = FirebaseDatabase.instance.ref("37").child("fan");
  // DatabaseReference ref4 = FirebaseDatabase.instance.ref("37").child("servo");
  // DatabaseReference ref5 = FirebaseDatabase.instance.ref("37").child("flame");
  // DatabaseReference ref6 = FirebaseDatabase.instance.ref("37").child("tv");
  saveUserName() async {
    await userName.add({
      "name": name.text,
      "id": FirebaseAuth.instance.currentUser!.uid
    }).then((value) {
      print("------------------------user Added");
    }).catchError(
        (error) => print("==================Failed to add user: $error"));

    var passCodeFire = FirebaseFirestore.instance
        .collection('passcode')
        .doc("${FirebaseAuth.instance.currentUser!.uid}");

    await passCodeFire.set({
      "passcode": passcode.text,
      "id": FirebaseAuth.instance.currentUser!.uid
    }).then((value) {
      print("------------------------passCode Added");
    }).catchError(
        (error) => print("==================Failed to add passCode: $error"));

    // ref = FirebaseDatabase.instance.ref("$passcode").child("ac");
    // ref2 = FirebaseDatabase.instance.ref("$passcode").child("led");
  }

  //#########################################
  // String FB_pin_22 = "",
  //     FB_pin_25 = "",
  //     FB_pin_26 = "",
  //     FB_pin_27 = "",
  //     FB_pin_28 = "",
  // FB_pin_11 = "";

  getData2() {
    // ref.onValue.listen((event) {
    //   FB_pin_25 = event.snapshot.value.toString();
    //   print("#####${FB_pin_25}");

    //   print("@@@@@@@${FB_pin_25.contains("true")}");
    // });

    // ref2.onValue.listen((event) {
    //   FB_pin_26 = event.snapshot.value.toString();
    //   print("#####${FB_pin_26}");

    //   print("@@@@@@@${FB_pin_26.contains("true")}");
    // });
    // ref3.onValue.listen((event) {
    //   FB_pin_27 = event.snapshot.value.toString();
    //   print("#####${FB_pin_27}");

    //   print("@@@@@@@${FB_pin_27.contains("true")}");
    // });

    // ref4.onValue.listen((event) {
    //   FB_pin_22 = event.snapshot.value.toString();
    //   print("#####${FB_pin_22}");

    //   print("@@@@@@@${FB_pin_22.contains("on")}");
    // });

    // ref5.onValue.listen((event) {
    //   FB_pin_11 = event.snapshot.value.toString();
    //   print("#####${FB_pin_11}");

    //   print("@@@@@@@${FB_pin_11.contains("noDetection")}");
    // });

    // ref6.onValue.listen((event) {
    //   FB_pin_28 = event.snapshot.value.toString();
    //   print("#####${FB_pin_28}");

    //   print("@@@@@@@${FB_pin_28.contains("true")}");
    // });
  }
  // GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // getData2();
    super.initState();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Form(
              // key: formstate,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          // height: 100,
                          height: height * .12,
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 15)),
                            Text("HI, ", style: TextStyle(fontSize: 55)),
                            Text("Good day",
                                style:
                                    TextStyle(fontSize: 55, color: Colors.cyan))
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 330
                                  : 10),
                          child: Text(
                              "Enter user name and password to create your account"),
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 200
                        : 250,
                    // height: height * .3,
                    width: double.infinity,
                  ),
                  Container(
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    width: 360,
                  ),
                  SizedBox(
                    // height: 50,
                    height: height * .06,
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Your forgot enter your email";
                        } else if (!value!.contains("@")) {
                          return "Your email must contain @";
                        }
                      },
                      controller: email,
                      decoration: InputDecoration(
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    width: 360,
                  ),
                  SizedBox(
                    // height: 50,
                    height: height * .06,
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Your forgot enter your password";
                        }
                      },
                      controller: pass,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: col,
                          ),
                          onTap: () {
                            setState(() {
                              if (c == 0) {
                                col = Colors.blue;
                                obscureText = false;
                                c = 1;
                              } else {
                                obscureText = true;
                                col = Colors.grey;
                                c = 0;
                              }
                            });
                          },
                        ),
                        hintText: "Enter password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    width: 360,
                  ),
                  SizedBox(
                    // height: 50,
                    height: height * .06,
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "repeat password";
                        }
                      },
                      controller: conPass,
                      obscureText: obscureText2,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: col2,
                          ),
                          onTap: () {
                            setState(() {
                              if (c2 == 0) {
                                col2 = Colors.blue;
                                obscureText2 = false;
                                c2 = 1;
                              } else {
                                obscureText2 = true;
                                col2 = Colors.grey;
                                c2 = 0;
                              }
                            });
                          },
                        ),
                        hintText: "Confirm password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    width: 360,
                  ),
                  SizedBox(
                    // height: 50,
                    height: height * .04,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 10),
                    alignment: Alignment.centerRight,
                    child: Text("${message}"),
                  ),
                  SizedBox(
                    // height: 30,
                    height: height * .03,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        // if (formstate.currentState!.validate()) {
                        if (pass.text == conPass.text) {
                          print("%%% true");

                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: pass.text,
                          );
                          saveUserName();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (route) => false);
                        } else {
                          setState(() {
                            message =
                                "Password is not equal to confirm password";
                          });
                          print("%%% false");
                        }
                        // }
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          if (e.code == 'weak-password') {
                            message = "The password provided is too weak";
                            print(
                                '----------------The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            message =
                                "The account already exists for that email";
                            print(
                                '---------------The account already exists for that email.');
                          }
                        });
                      }
                    },
                    child: Text(
                      "Create acount",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 10, horizontal: 75))),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
