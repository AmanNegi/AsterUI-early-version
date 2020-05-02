import 'package:flutter/material.dart';
import 'package:main_barber/Operator.dart';
import 'package:main_barber/MergedLayouts/gmailLogin.dart';
import 'package:main_barber/MergedLayouts/phoneNumberLogin.dart';
import 'package:main_barber/redirectorToTheProfiles.dart';
import './LayoutBuilderHelper/CurvePainter.dart';

class LoginOptions extends StatefulWidget {
  final Operator operator;

  LoginOptions(this.operator);

  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    var redirector = RedirectorToTheProfiles(operator: widget.operator);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      body: CustomPaint(
        painter: CurvePainter(color1: Colors.white54, color2: Colors.white54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 5),
                child: IconButton(
                  iconSize: 25,
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Spacer(),
            Image.asset(
              widget.operator.index == 0
                  ? "assets/customer.png"
                  : "assets/barber.png",
              width: (80 / 100) * width,
              height: (25 / 100) * height,
            ),
            SizedBox(
              height: (8 / 100) * height,
            ),
            buttonBuilder("Login with Gmail",
                GmailLogin(operator: widget.operator), width),
            buttonBuilder("Login with OTP",
                PhoneNumberLogin(operator: widget.operator), width),
            Spacer(),
            buttonBuilder(
                "Continue as Guest", redirector.getRespectiveLayouts(), width),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonBuilder(
      String buttonText, Widget destinationWidget, double width) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonTheme(
          minWidth: (80 / 100) * width,
          child: RaisedButton(
            color: Colors.white70,
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contxt) => destinationWidget,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
