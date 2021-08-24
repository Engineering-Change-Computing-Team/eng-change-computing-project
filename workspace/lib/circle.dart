import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff91C07C)
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(Offset(size.width * 0.5, 50), 300, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}