import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  Color color1;
  Color color2;

  CurvePainter({this.color1, this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color1;
    paint.style = PaintingStyle.fill;

    var paint2 = Paint();
    paint2.color = color2;
    paint2.style = PaintingStyle.fill;

    var path1 = Path();
    path1.moveTo(0, size.height * 0.125);
    path1.quadraticBezierTo(size.width * 0.50, size.height * 0.450, size.width,
        size.height * 0.375);
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);

    var path2 = Path();
    path2.moveTo(0, size.height * 0.125);
    path2.quadraticBezierTo(
        size.width * 0.45, size.height * 0.40, size.width, size.height * 0.370);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
