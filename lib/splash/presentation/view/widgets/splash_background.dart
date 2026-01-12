import 'dart:math' as math;
import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(painter: SplashBackgroundPainter()),
    );
  }
}

class SplashBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    const radialGradient = RadialGradient(
      center: Alignment.center,
      radius: 1.2,
      colors: [Color(0xFFFDF7F5), Color(0xFFF5EFEB)],
    );
    canvas.drawRect(rect, Paint()..shader = radialGradient.createShader(rect));

    final paint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.08)
      ..strokeWidth = 0.5;

    const double spacing = 35;
    for (double i = spacing / 2; i < size.width; i += spacing) {
      for (double j = spacing / 2; j < size.height; j += spacing) {
        canvas.drawCircle(Offset(i, j), 0.7, paint);
      }
    }

    final ripplePaint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final center = Offset(size.width / 2, size.height / 2);
    for (double r = 80; r < size.height * 0.8; r += 120) {
      canvas.drawCircle(center, r, ripplePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
