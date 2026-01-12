import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoetrySection extends StatelessWidget {
  const PoetrySection({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: Padding(
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
          ),
        );
      },
    );
  }
}
