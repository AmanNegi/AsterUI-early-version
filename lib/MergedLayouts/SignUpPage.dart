import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';

import 'package:main_barber/Operator.dart';
import 'package:main_barber/imported/EnsureVisibleWhenFocused.dart';
import '../LayoutBuilderHelper/TextFormBuilder.dart';
import '../LayoutBuilderHelper/PhoneNumberBlockBuilder.dart';
import '../HelperMethods/OperatorRecognizer.dart';
import '../LayoutBuilderHelper/CurvePainter.dart';

class SignUpPage extends StatelessWidget {
  final FocusNode focusNode = new FocusNode();
  final Operator operator;
  var _formKey = new GlobalKey<FormState>();

  var name;
  var phoneNumber;
  var countryCode;
  var password;
  var reEnteredPassword;

  SignUpPage({this.operator});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:
            Text("Register as a ${OperatorRecognizer.getStringUser(operator)}"),
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
                        height: (60 / 100) * height,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListView(
                          children: <Widget>[
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormBuilder(
                                hintText: "Name",
                                onSaved: (value) {
                                  print(value);
                                },
                                validator: (String value) {
                                  if (value.length == 0)
                                    return "Enter some text";
                                  return null;
                                },
                                icon: Icon(Icons.text_fields),
                                keybordType: TextInputType.text,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: PhoneNumberBlockBuilder(
                                onSavedCountryCode: (CountryCode code) {
                                  print(" In Barber_auth : " + code.toString());
                                },
                                onSavedPhoneNumber: (value) {
                                  print('value');
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormBuilder(
                                hintText: "Password",
                                onSaved: (value) {
                                  print(value);
                                },
                                validator: (String value) {
                                  if (value.length == 0)
                                    return "Enter some text";
                                  return null;
                                },
                                icon: Icon(Icons.vpn_key),
                                keybordType: TextInputType.visiblePassword,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormBuilder(
                                hintText: "Re-enter Password",
                                onSaved: (value) {
                                  print(value);
                                },
                                validator: (String value) {
                                  if (value.length == 0)
                                    return "Enter some text";
                                  return null;
                                },
                                icon: Icon(Icons.lock_open),
                                keybordType: TextInputType.visiblePassword,
                              ),
                            ),
                            SizedBox(
                              height: (5 / 100) * height,
                            ),
                            RaisedButton(
                              color: Colors.blue[100],
                              child: Text("Create Account"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }
                              },
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
}
