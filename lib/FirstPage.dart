import 'package:flutter/material.dart';
import 'package:main_barber/LoginOptions.dart';
import 'package:main_barber/Operator.dart';

import './LayoutBuilderHelper/CurvePainter.dart';

class FirstPage extends StatelessWidget {

 static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: fromHex("#caedfd"),
      body: Builder(
        builder: (BuildContext usableContext) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Container(
            child: CustomPaint(
              painter: CurvePainter(
                  color1: Colors.lightBlueAccent, color2: Colors.lightBlue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: (40 / 100) * height,
                  ),
                  Text(
                    "WHO ARE YOU ?",
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.1),
                  ),
                  SizedBox(height: (10 / 100) * height, width: width),
                  buildCustomerButton(usableContext),
                  SizedBox(
                    height: 50,
                  ),
                  buildBarberButton(usableContext),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBarberButton(BuildContext usableContext) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: InkWell(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        splashColor: Colors.lightBlueAccent,
        onTap: () {
          Navigator.of(usableContext).push(
            MaterialPageRoute(
              builder: (context) => LoginOptions(Operator.BARBER),
            ),
          );
        },
        child: Ink(
          height: 80,
          child: Center(
            child: Text(
              "BARBER",
              style: TextStyle(fontSize: 35),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomerButton(BuildContext usableContext) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: InkWell(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        splashColor: Colors.lightBlueAccent,
        onTap: () {
          Navigator.of(usableContext).push(
            MaterialPageRoute(
              builder: (context) => LoginOptions(Operator.USER),
            ),
          );
        },
        child: Ink(
          height: 80,
          child: Center(
            child: Text(
              "CUSTOMER",
              style: TextStyle(fontSize: 35),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.blue[100]),
        ),
      ),
    );
  }
}
