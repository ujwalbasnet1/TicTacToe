import 'package:flutter/material.dart';
import 'package:tic_tac_toe/cross/cross_painter.dart';

class Cross extends StatefulWidget {
  @override
  _CrossState createState() => _CrossState();
}

class _CrossState extends State<Cross> with SingleTickerProviderStateMixin {
  double fraction = 0;
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() => fraction = animation.value);
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() => fraction = 0);
          controller.reset();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onDoubleTap: () {
          controller.forward();
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.grey,
          child: CustomPaint(
            painter: CrossPainter(fraction: fraction),
          ),
        ),
      ),
    );
  }
}
