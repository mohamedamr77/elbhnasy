import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'EST.2026',
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
                backgroundColor: const Color(0xFFCBB07B).withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
