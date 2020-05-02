import 'package:flutter/material.dart';
import 'package:main_barber/HelperMethods/OperatorRecognizer.dart';

import 'package:main_barber/MergedLayouts/SignUpPage.dart';
import '../LayoutBuilderHelper/TextFormBuilder.dart';
import 'package:main_barber/imported/EnsureVisibleWhenFocused.dart';
import '../Operator.dart';
import '../LayoutBuilderHelper/CurvePainter.dart';

class GmailLogin extends StatefulWidget {
  final Operator operator;

  GmailLogin({this.operator});

  @override
  _GmailLoginState createState() => _GmailLoginState();
}

class _GmailLoginState extends State<GmailLogin> {
  var _formKey = GlobalKey<FormState>();
  FocusNode focusNode = new FocusNode();
  String userType;
  var passwordEntered;
  var gmailEntered;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("$userType Auth"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: EnsureVisibleWhenFocused(
          focusNode: focusNode,
          child: Material(
            child: Form(
              key: _formKey,
              child: CustomPaint(
                painter: CurvePainter(
                    color1: Colors.lightBlue[100], color2: Colors.lightBlue),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: (10 / 100) * height,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10.0)),
                        height: (60 / 100) * height,
                        child: ListView(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormBuilder(
                                hintText: "Gmail",
                                icon: Icon(Icons.mail),
                                onSaved: (String value) {
                                  setState(() {
                                    gmailEntered = value;
                                  });
                                },
                                validator: (String value) {
                                  if (value.length == 0)
                                    return "Enter your Email";
                                  return null;
                                },
                                keybordType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormBuilder(
                                hintText: "Password",
                                onSaved: (value) {
                                  setState(() {
                                    passwordEntered = value;
                                  });
                                },
                                validator: (String value) {
                                  if (value.length == 0)
                                    return "Enter your passoword";
                                  return null;
                                },
                                icon: Icon(Icons.vpn_key),
                                keybordType: TextInputType.visiblePassword,
                              ),
                            ),
                            SizedBox(
                              height: (5 / 100) * height,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RaisedButton(
                                  color: Colors.blue[100],
                                  child: Text("Login"),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      //TODO add authentication logic here...
                                      //TODO add sharedPrefs logic here..
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: (2 / 100) * height,
                            ),
                            Center(
                              child: GestureDetector(
                                child: Text(
                                  "New $userType? Sign Up",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignUpPage(
                                        operator:
                                            widget.operator == Operator.USER
                                                ? Operator.USER
                                                : Operator.BARBER,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userType = OperatorRecognizer.getStringUser(widget.operator);
    super.initState();
  }
}
