import 'dart:async';
import 'package:main_barber/barber/MainScreenBarber.dart';
import 'package:main_barber/user/MainScreenUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FirstPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: "Raleway",
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget defaultPage = FirstPage();
  void checkSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    if (sharedPrefs.containsKey("firstTime")) {
      int userType = sharedPrefs.getInt("userType");
      if (userType == 0) {
        setState(() {
          defaultPage = MainScreenUser();
        });
      } else if (userType == 1) {
        setState(() {
          defaultPage = MainScreenBarber();
        });
      }
    } //User =0; Barber =1;
  }

  @override
  void initState() {
    super.initState();
    checkSharedPrefs();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => FirstPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Add more features to splashScreen
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/splash_screen.gif",
            height: (40 / 100) * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
