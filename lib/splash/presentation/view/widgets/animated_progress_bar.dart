import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedProgressBar extends StatelessWidget {
  const AnimatedProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 0.7),
            duration: const Duration(milliseconds: 3500),
            curve: Curves.easeInOutSine,
            builder: (context, value, child) {
              return Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFCBB07B),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              );
            },
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
    );
  }
}
