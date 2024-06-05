import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintEx extends CustomPainter {
  @override

  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    //TODO:: 잘안됌 다시해야함 오류
    canvas.drawLine(Offset(0,0 ), Offset(100, 100), paint);
    // canvas.drawCircle(
    //     Offset(size.width.toInt() / 2, size.width.toInt() / 2), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
