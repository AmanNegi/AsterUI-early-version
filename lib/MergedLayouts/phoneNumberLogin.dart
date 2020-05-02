import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:main_barber/HelperMethods/OperatorRecognizer.dart';
import 'package:main_barber/LayoutBuilderHelper/PhoneNumberBlockBuilder.dart';

import 'package:main_barber/MergedLayouts/SignUpPage.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:main_barber/imported/EnsureVisibleWhenFocused.dart';
import '../Operator.dart';
import '../LayoutBuilderHelper/CurvePainter.dart';

class PhoneNumberLogin extends StatefulWidget {
  final Operator operator;

  PhoneNumberLogin({this.operator});

  @override
  _PhoneNumberLoginState createState() => _PhoneNumberLoginState();
}

class _PhoneNumberLoginState extends State<PhoneNumberLogin> {
  var _formKey = GlobalKey<FormState>();
  FocusNode focusNode = new FocusNode();
  String userType;
  var pinEntered;
  var phoneNumber;
  var countryCode;
  var passwordEntered;

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
                    color1: Colors.lightBlueAccent[100],
                    color2: Colors.lightBlue),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: (10 / 100) * height,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10.0)),
                        height: (50 / 100) * height,
                        child: ListView(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: PhoneNumberBlockBuilder(
                                onSavedCountryCode: (CountryCode code) {
                                  setState(() {
                                    countryCode = code.code;
                                  });
                                },
                                onSavedPhoneNumber: (value) {
                                  setState(() {
                                    phoneNumber = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: (15 / 100) * height,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RaisedButton(
                                color: Colors.blue[100],
                                child: Text("Login"),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    _showBottomModalSheet(context, height);
                                  }
                                },
                              ),
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
                            )
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

  void _showBottomModalSheet(BuildContext context, double height) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(),
      backgroundColor: Colors.transparent,
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: (60 / 100) * height,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Enter OTP",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              PinEntryTextField(
                onSubmit: (value) {
                  print(value);
                  setState(() {
                    pinEntered = value;
                  });
                },
              ),
              SizedBox(
                height: (20 / 100) * height,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.blue[100],
                  child: Text("Validate"),
                  //TODO add pin-code authentication here
                  //TODO add sharedPrefs logic here..
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/mainScreen");
                  },
                ),
              ),
            ],
          ),
        );
      },
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
