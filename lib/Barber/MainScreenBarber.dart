import 'dart:io';

import 'package:flutter/material.dart';

class MainScreenBarber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Main Screen"),
      ),
      body: WillPopScope(
        onWillPop: () {
          exit(0);
          return null;
        },
        child: Container(),
      ),
    );
  }
}
