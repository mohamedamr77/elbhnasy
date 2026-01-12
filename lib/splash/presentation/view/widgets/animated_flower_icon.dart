import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedFlowerIcon extends StatelessWidget {
  const AnimatedFlowerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: CustomPaint(painter: FlowerPainter()),
            ),
          ),
        );
      },
    );
  }
}

class FlowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 6;

    final centerPaint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius / 2, centerPaint);

    const int petalCount = 6;
    for (int i = 0; i < petalCount; i++) {
      final double angle = (i * 2 * math.pi) / petalCount - (math.pi / 2);
      final double petalCenterX = center.dx + math.cos(angle) * (radius * 1.5);
      final double petalCenterY = center.dy + math.sin(angle) * (radius * 1.5);

      final path = Path();
      path.addOval(
        Rect.fromCenter(
          center: Offset(petalCenterX, petalCenterY),
          width: radius * 1.8,
          height: radius * 1.2,
        ),
      );

      final Matrix4 matrix = Matrix4.identity()
        ..translate(petalCenterX, petalCenterY)
        ..rotateZ(angle + math.pi / 2)
        ..translate(-petalCenterX, -petalCenterY);

      canvas.drawPath(path.transform(matrix.storage), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
