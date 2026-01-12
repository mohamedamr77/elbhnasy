import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedArabicName extends StatelessWidget {
  final String name;
  final Duration delay;
  const AnimatedArabicName({
    super.key,
    required this.name,
    this.delay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Text(
              name,
              style: GoogleFonts.arefRuqaa(
                color: const Color(0xFFCBB07B),
                fontSize: 54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
