import 'package:flutter/material.dart';

class IntroClipCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFDBA16)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill;

    final width = size.width;
    final path = Path();

    path.moveTo(width / 1.9, 0);
    path.lineTo(width, 0);
    path.lineTo(width, width / 2.4);
    path.arcToPoint(
      Offset(width / 1.9, 0),
      radius: Radius.circular(width / 1.7),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No need to repaint for now
  }
}