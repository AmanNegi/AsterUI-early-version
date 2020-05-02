import 'package:flutter/material.dart';
import 'package:main_barber/Operator.dart';

class OperatorRecognizer {
//TODO: add other Operator regarding functions here


  static String getStringUser(Operator operator) {
    switch (operator.index) {
      case 0:
        {
          return "User";
        }
      case 1:
        {
          return "Barber";
        }
      case 2:
        {
          return "Guest";
        }
      default:
        throw Exception(" No Value received");
    }
  }

}
