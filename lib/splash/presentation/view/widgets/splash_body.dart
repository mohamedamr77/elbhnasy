import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../home/presentation/view/home_view.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Pattern
        Positioned.fill(child: CustomPaint(painter: SplashBackgroundPainter())),
        // Main Content
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                // Flower Icon
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CustomPaint(painter: FlowerPainter()),
                ),
                const SizedBox(height: 40),
                // Arabic Name 1
                Text(
                  'محمد',
                  style: GoogleFonts.arefRuqaa(
                    color: const Color(0xFFCBB07B),
                    fontSize: 54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Heart Separator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 0.5,
                      color: const Color(0xFFCBB07B).withOpacity(0.4),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.favorite,
                        color: Color(0xFFCBB07B),
                        size: 22,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 0.5,
                      color: const Color(0xFFCBB07B).withOpacity(0.4),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Arabic Name 2
                Text(
                  'هدى',
                  style: GoogleFonts.arefRuqaa(
                    color: const Color(0xFFCBB07B),
                    fontSize: 54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),
                // Subtitle
                Text(
                  'WELCOME TO OUR STORY',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 12,
                    letterSpacing: 4,
                  ),
                ),
                const Spacer(flex: 4),
                // Loading Progress Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: 0.7, // As seen in image
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFCBB07B),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'INITIALIZING JOY',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFFCBB07B).withOpacity(0.8),
                          fontSize: 9,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                // Footer
                Text(
                  'EST.2024',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFFCBB07B).withOpacity(0.8),
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 1.5,
                        backgroundColor: const Color(
                          0xFFCBB07B,
                        ).withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SplashBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Background Radial Gradient
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

    // Grid Dots
    const double spacing = 35;
    for (double i = spacing / 2; i < size.width; i += spacing) {
      for (double j = spacing / 2; j < size.height; j += spacing) {
        canvas.drawCircle(Offset(i, j), 0.7, paint);
      }
    }

    // Concentric Circles (Ripple)
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

class FlowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 6;

    // Center dot (hollow center look)
    final centerPaint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius / 2, centerPaint);

    // Petals
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
