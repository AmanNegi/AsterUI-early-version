import 'package:flutter/material.dart';
import 'package:main_barber/HelperMethods/OperatorRecognizer.dart';
import 'package:main_barber/Operator.dart';
import 'package:main_barber/barber/MainScreenBarber.dart';
import 'package:main_barber/user/MainScreenUser.dart';

class RedirectorToTheProfiles {
  Operator operator;
  RedirectorToTheProfiles({this.operator});

  Widget getRespectiveLayouts() {
    var value = OperatorRecognizer.getStringUser(operator);
    if(value=="User")return MainScreenUser();
    else return MainScreenBarber();
  }
}
