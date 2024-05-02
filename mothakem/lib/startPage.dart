import 'package:flutter/material.dart';
import 'package:mothakem/login.dart';
import 'package:mothakem/signup.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: ListView(children: [
            SafeArea(
                child: Column(
              children: [
                Container(
                  height: height * .60,
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("images/login.png"),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_outlined,
                        size: 45, color: Colors.blue[400]),
                    SizedBox(
                      width: width * .01,
                    ),
                    Text(
                      "IHomA",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.blue[400],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 155))),
                ),
                SizedBox(
                  height: height * .03,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 155))),
                )
              ],
            )),
          ]),
        ),
      ),
    );
  }
}
