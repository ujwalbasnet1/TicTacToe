import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPainter extends CustomPainter {
  double fraction;
  Paint _paint;

  CrossPainter({@required this.fraction}) {
    _paint = Paint()
      ..color = Colors.deepOrange
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double firstFraction = 0;
    double secondFraction = 0;

    if (fraction < 0.5) {
      firstFraction = fraction / 0.5;
      secondFraction = 0;
    } else {
      firstFraction = 1;
      secondFraction = (fraction - 0.5) / 0.5;
    }

    canvas.drawLine(
        Offset(0, 0),
        Offset(size.width * firstFraction, size.height * firstFraction),
        _paint);

    if (fraction >= 0.5) {
      canvas.drawLine(Offset(size.width, 0),
          Offset(size.width - size.width * secondFraction, size.height * secondFraction), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
