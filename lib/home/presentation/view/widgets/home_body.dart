import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Pattern (Same as splash but maybe lighter or different circles)
        // Positioned.fill(child: CustomPaint(painter: HomeBackgroundPainter())),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'THE ENGAGEMENT',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFCBB07B),
                            fontSize: 14,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFFCBB07B),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Profile Image with circular frame
                Center(
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFCBB07B).withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFCBB07B).withOpacity(0.4),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const CircleAvatar(
                        radius: 120,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/persons.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Poetry/Quote
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'أخفيتك دهراً وأنتِ سِرٌّ مُعلنٌ\nفي ملامحي، والآن نطقتُ\nبحبكِ يا خيرةَ الله واختياري',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.arefRuqaa(
                      fontSize: 28,
                      height: 1.5,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Star Separator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 0.5,
                      color: const Color(0xFFCBB07B).withOpacity(0.4),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.star,
                        color: Color(0xFFCBB07B),
                        size: 20,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 0.5,
                      color: const Color(0xFFCBB07B).withOpacity(0.4),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Names Button-like container
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'محمد',
                        style: GoogleFonts.arefRuqaa(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFFCBB07B),
                          size: 18,
                        ),
                      ),
                      Text(
                        'هدى',
                        style: GoogleFonts.arefRuqaa(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HomeBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Background Radial Gradient
    final Rect rect = Offset.zero & size;
    final radialGradient = RadialGradient(
      center: Alignment.center,
      radius: 1.2,
      colors: [const Color(0xFFFDF7F5), const Color(0xFFF5EFEB)],
    );
    canvas.drawRect(rect, Paint()..shader = radialGradient.createShader(rect));

    final paint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.08)
      ..strokeWidth = 0.5;

    // Grid Dots
    const double spacing = 35;
    for (double i = spacing / 2; i < size.width; i += spacing) {
      for (double j = spacing / 2; j < size.height; j += spacing) {
        canvas.drawCircle(Offset(i, j), 1, paint);
      }
    }

    // Larger subtle blurred circles
    final circlePaint = Paint()
      ..color = const Color(0xFFCBB07B).withOpacity(0.03)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.2),
      40,
      circlePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.4),
      60,
      circlePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.7),
      50,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
