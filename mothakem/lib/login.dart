import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mothakem/newHomePage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passcode = TextEditingController();
  TextEditingController passcode2 = TextEditingController();
  String message = "";
  Color col = Colors.grey;
  int c = 0;
  bool obscureText = true;

  //#########################################
  String FB_pin_22 = "",
  FB_pin_23 = "",
      FB_pin_25 = "",
      FB_pin_26 = "",
      FB_pin_27 = "",
      FB_pin_28 = "",
      FB_pin_9 = "",
      FB_pin_11 = "";

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
    FD = FirebaseDatabase.instance.ref("${passcode.text}");
    ref = FirebaseDatabase.instance.ref("${passcode.text}").child("AC");
    ref2 = FirebaseDatabase.instance.ref("${passcode.text}").child("led");
    ref3 = FirebaseDatabase.instance.ref("${passcode.text}").child("fan");
    ref4 = FirebaseDatabase.instance.ref("${passcode.text}").child("front");
    ref8 = FirebaseDatabase.instance.ref("${passcode.text}").child("garage");
    ref5 = FirebaseDatabase.instance.ref("${passcode.text}").child("flame");
    ref6 = FirebaseDatabase.instance.ref("${passcode.text}").child("tv");
    ref6 = FirebaseDatabase.instance.ref("${passcode.text}").child("gas");
    getData2();
  }

  getData2() {
    ref.onValue.listen((event) {
      FB_pin_25 = event.snapshot.value.toString();
      print("#####login${FB_pin_25}");

      print("@@@@@@@login${FB_pin_25.contains("true")}");
    });

    ref2.onValue.listen((event) {
      FB_pin_26 = event.snapshot.value.toString();
      print("#####login${FB_pin_26}");

      print("@@@@@@@login${FB_pin_26.contains("true")}");
    });
    ref3.onValue.listen((event) {
      FB_pin_27 = event.snapshot.value.toString();
      print("#####${FB_pin_27}");

      print("@@@@@@@${FB_pin_27.contains("true")}");
    });

    ref4.onValue.listen((event) {
      FB_pin_22 = event.snapshot.value.toString();
      print("#####${FB_pin_22}");

      print("@@@@@@@${FB_pin_22.contains("on")}");
    });
    ref8.onValue.listen((event) {
      FB_pin_23 = event.snapshot.value.toString();
      print("#####${FB_pin_23}");

      print("@@@@@@@${FB_pin_23.contains("on")}");
    });
    ref5.onValue.listen((event) {
      FB_pin_11 = event.snapshot.value.toString();
      print("#####${FB_pin_11}");

      print("@@@@@@@${FB_pin_11.contains("Detection")}");
    });

    ref6.onValue.listen((event) {
      FB_pin_28 = event.snapshot.value.toString();
      print("#####${FB_pin_28}");

      print("@@@@@@@${FB_pin_28.contains("true")}");
    });

    ref7.onValue.listen((event) {
      FB_pin_9 = event.snapshot.value.toString();
      print("#####${FB_pin_9}");

      print("@@@@@@@${FB_pin_9.contains("Detection")}");
    });
  }

  List m = [];
  removePasscode() async {
    var userPasscode = FirebaseFirestore.instance
        .collection('passcode')
        .doc("${FirebaseAuth.instance.currentUser!.uid}");
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection('passcode')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    m.addAll(response.docs);
    setPasscode();
  }

  setPasscode() async {
    var userPasscode = FirebaseFirestore.instance
        .collection('passcode')
        .doc("${FirebaseAuth.instance.currentUser!.uid}");
    print("((((((((((Passcode is clicked))))))))))");
    await userPasscode.set({
      "passcode": passcode.text,
      "id": FirebaseAuth.instance.currentUser!.uid
    }).then((value) {
      initialDatabaseReference();
      print("------------------------passcode Added");
    }).catchError(
        (error) => print("==================Failed to add passcode: $error"));
  }

  @override
  void initState() {
    super.initState();
  }

  // signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   // Obtain the auth details from the request
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  //   // Create a new credential
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   //=================================================================================
  //   CollectionReference userName =
  //       FirebaseFirestore.instance.collection('name');
  //   CollectionReference userPasscode =
  //       FirebaseFirestore.instance.collection('passcode');
  //   await userName.add({
  //     "name": userCredential.user!.displayName,
  //     "id": FirebaseAuth.instance.currentUser!.uid
  //   }).then((value) {
  //     print("------------------------user Added");
  //   }).catchError(
  //       (error) => print("==================Failed to add user: $error"));
  //   //------------------------------------------------------------

  //   await userPasscode.add({
  //     "passcode": passcode.text,
  //     "id": FirebaseAuth.instance.currentUser!.uid
  //   }).then((value) {
  //     print("------------------------passcode Added");
  //   }).catchError(
  //       (error) => print("==================Failed to add passcode: $error"));
  //   //=====================================================================================
  //   showAboutDialog(context: context, children: [
  //     Container(
  //       child: TextFormField(
  //         validator: (value) {
  //           if (value!.isEmpty) {
  //             return "Your must enter pass code of your home";
  //           }
  //         },
  //         controller: passcode2,
  //         decoration: InputDecoration(
  //           hintText: "Enter pass code",
  //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
  //         ),
  //       ),
  //       width: 360,
  //     ),
  //     ElevatedButton(onPressed: () async {
  //       removePasscode();
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => HomePage(
  //               FB_pin_9: FB_pin_9,
  //               FB_pin_11: FB_pin_11,
  //               FB_pin_22: FB_pin_22,
  //               FB_pin_25: FB_pin_25,
  //               FB_pin_26: FB_pin_26,
  //               FB_pin_27: FB_pin_27,
  //               FB_pin_28: FB_pin_28,
  //               passcode: passcode.text,
  //             ),
  //           ),
  //           (route) => false);
  //     },
  //     child: Text("Login"),),
  //   ]);
  // Navigator.pushAndRemoveUntil(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => HomePage(
  //       FB_pin_9: FB_pin_9,
  //       FB_pin_11: FB_pin_11,
  //       FB_pin_22: FB_pin_22,
  //       FB_pin_25: FB_pin_25,
  //       FB_pin_26: FB_pin_26,
  //       FB_pin_27: FB_pin_27,
  //       FB_pin_28: FB_pin_28,
  //       passcode: passcode2.text,
  //     ),
  //   ),
  //   (route) => false,
  // );
  //   print("=============${userCredential.user!.email}");
  // }

  GlobalKey<FormState> formstate = GlobalKey();

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .12,
                          // height: 100,
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
                                  ? 430
                                  : 105),
                          child: Text("Enter user name and password to login"),
                        ),
                      ],
                    ),

                    height: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 200
                        : 250,
                    // height: height * .38,
                    width: double.infinity,
                  ),
                  Container(
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (message ==
                            "please enter your email to send password") {
                          return "please enter your email to send password";
                        }
                        if (message == "Wrong email or password") {
                          return "Wrong email or";
                        }
                        if (value!.isEmpty) {
                          return "You forgot to enter your email";
                        } else if (!value!.contains("@")) {
                          return "You email must contain @";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    width: 360,
                  ),
                  SizedBox(
                    // height: 50,
                    height: height * .04,
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "You forgot to enter your password";
                        } else if (message == "Wrong email or password") {
                          return "wrong password";
                        }
                        print("===============val ${value}");
                      },
                      obscureText: obscureText,
                      controller: pass,
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
                    height: height * .04,
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Your must enter pass code of your home";
                        }
                        if (message.contains("Not found this passcode")) {
                          return "Not found this passcode";
                        }
                      },
                      controller: passcode,
                      decoration: InputDecoration(
                        hintText: "Enter pass code",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    width: 360,
                  ),
                  InkWell(
                    onTap: () async {
                      if (formstate.currentState!.validate()) {
                        if (email.text == "") {
                          print("-------------------------------------------");
                          setState(() {
                            message =
                                "please enter your email to send password";
                          });
                          return;
                        }

                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email.text);
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10, right: 20),
                      alignment: Alignment.topRight,
                      child: Text("Forgot password?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    // height: 30,
                    height: height * .03,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10, bottom: 10),
                    alignment: Alignment.centerRight,
                    child: Text("${message}"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String pc = '';
                      DatabaseReference Fdd =
                          FirebaseDatabase.instance.ref(passcode.text);
                      Fdd.onValue.listen((event) async {
                        pc = await event.snapshot.value.toString();
                        print("FDDD ${pc}");
                        if (pc != "null") {
                          setState(() {
                            message = '';
                          });
                        }
                        if (pc == "null") {
                          setState(() {
                            message = "Not found this passcode";
                          });
                        }
                        if (formstate.currentState!.validate()) {
                          if (pc == "null") {
                            setState(() {
                              message = "Not found this passcode";
                            });
                          } else if (pc != "null") {
                            setState(() {
                              message = '';
                            });
                            print("FDDD af ${pc}");
                            if (email.text == "") {
                              setState(() {
                                message = "you forgot enter email";
                              });
                            } else if (pass.text == "") {
                              setState(() {
                                message = "you forgot enter password";
                              });
                            } else {
                              try {
                                // if (formstate.currentState!.validate()) {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: email.text,
                                  password: pass.text,
                                );
                                removePasscode();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(
                                        FB_pin_9: FB_pin_9,
                                        FB_pin_11: FB_pin_11,
                                        FB_pin_22: FB_pin_22,
                                        FB_pin_25: FB_pin_25,
                                        FB_pin_26: FB_pin_26,
                                        FB_pin_27: FB_pin_27,
                                        FB_pin_28: FB_pin_28,
                                        FB_pin_23: FB_pin_23,
                                        passcode: passcode.text,
                                      ),
                                    ),
                                    (route) => false);
                                // } else {
                                //   print("not vaild");
                                // }
                              } on FirebaseAuthException catch (e) {
                                print(
                                    "-------------------------------- ecode ${e.code}");

                                setState(() {
                                  if (e.code != 'invalid-email') {
                                    if (formstate.currentState!.validate()) {
                                      message = "Wrong email or password";
                                    }
                                  }
                                });
                                print("-----------------message = " + message);
                              }
                            }
                          }
                        }
                      });
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 10, horizontal: 70))),
                  ),
                  SizedBox(
                    // height: 15,
                    height: height * .017,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     InkWell(
                  //       onTap: () async => await signInWithGoogle(),
                  //       child: Image.asset(
                  //         "images/google.png",
                  //         width: 35,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
